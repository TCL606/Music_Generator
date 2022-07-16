function [tunes, tunes_harmonic, fs] = analyse_tunes(wavpath, piece, base, interval, maximum_harmonic)
    [x, fs] = audioread(wavpath);
    x_size = size(x);
    if x_size(2) == 2
        x12 = x(:,1) + x(:,2); 
        x12_max = max(max(x12),abs(min(x12)));
        x = x12 ./ x12_max;      
    end
    x = x(1: round(end / piece));
    subplot(6, 1, 1);
    plot(linspace(0, length(x) - 1, length(x)) / fs, x);
    title('x');

    y1 = x.^2;
    subplot(6, 1, 2);
    plot(linspace(0, length(y1) - 1, length(y1)) / fs, y1);
    title('y1');

    w2 = barthannwin(round(fs / 11));
    y2 = conv(w2, y1);
    subplot(6, 1, 3);
    plot(linspace(0, length(y2) - 1, length(y2)) / fs, y2);
    title('y2');

    y3 = y2(2: end) - y2(1: end - 1);
    subplot(6, 1, 4);
    plot(linspace(0, length(y3) - 1, length(y3)) / fs, y3);
    title('y3');

    y4 = max(y3, 0);
    subplot(6, 1, 5);
    plot(linspace(0, length(y4) - 1, length(y4)) / fs, y4);
    title('y4');

    threshold_amp = 0.0015;
    y4(y4 < threshold_amp) = 0;
    y5 = y4;
    subplot(6, 1, 6);
    plot(linspace(0, length(y4) - 1, length(y4)) / fs, y4);
    title('y5');

   % interval = 500;
    threshold_interval = fs / 8; 
    [peak_val, real_idx] = find_peak(y5, interval, threshold_interval);

    subplot(6, 1, 6);
    hold on
    scatter((real_idx - 1) / fs, peak_val, 20, 'ro');
    hold off
    subplot(6, 1, 1);
    hold on
    scatter((real_idx - 1) / fs, zeros([length(real_idx), 1]), 20, 'y', 'filled');
    hold off

    base_fre = zeros(length(real_idx) + 1, 1);
    % base = [110, 220, 440, 880]';
    power = linspace(0, 1 - 1/12, 12);
    rate = 2.^power;
    tunes = base * rate;
    tunes_size = size(tunes);
    clear power reate

    % maximum_harmonic = 10;
    tunes_harmonic = zeros([tunes_size, maximum_harmonic]);
    bar = waitbar(0,'Getting the frequency of each tone ...');
    for i = 1: 1: length(real_idx) + 1
        if i == 1
            clip = x(1: real_idx(i));
        elseif i == length(real_idx) + 1
            clip = x(real_idx(end): end);
        else
            clip = x(real_idx(i - 1): real_idx(i));
        end
        win = gausswin(length(clip));
        clip = clip .* win;
        clip = repmat(clip, 100, 1);
        fft_amp = fft(clip);
        abs_fft_amp = abs(fft_amp);
        [max_abs, max_idx] = max(abs_fft_amp);
        max_fre = (max_idx - 1) / length(clip) * fs;
        [pre_peaks, peaksidx] = find_peak(abs_fft_amp, 1, 0.5);

        least_peak = 10;
        peaksidx = peaksidx(find(pre_peaks >= max_abs / least_peak));

        max_search_times = 15;
        max_error_fre = 10;
        N = length(clip);
        max_error_idx = max_error_fre * N / fs; 
        min_fre = base(1);
        min_fre_idx = min_fre * N / fs;
        choose_base_idx = [];
        times = 1;
        for j = max_search_times: -1: 1
            temp_idx = round(max_idx / j);
            if temp_idx < min_fre_idx - max_error_idx && j ~= 1
                continue
            end
            temp_choose = peaksidx(peaksidx >= temp_idx - max_error_idx & peaksidx <= temp_idx + max_error_idx);
            if length(temp_choose) ~= 0
                choose_base_idx = temp_choose;
                times = j;
                break
            end
        end
        [~, base_fre_num] = max(abs_fft_amp(choose_base_idx));
        base_fre_idx = choose_base_idx(base_fre_num);
        base_fre_amp = abs_fft_amp(base_fre_idx);

        % first judge whether the base frequency is correct. 
        % base_criterion is the limited threshold
        base_criterion = 2;
        for k = 2: 1: 5
            [k_amp, kidx] = max(abs_fft_amp(round((base_fre_idx - max_error_idx) * k): round((base_fre_idx + max_error_idx) * k)));
            if k_amp / base_fre_amp >= base_criterion
                base_fre_idx = kidx;
                base_fre_amp = k_amp;
                break
            end
        end

        temp_delta = tunes - base_fre_idx / length(clip) * fs;
        [~, temp_tunesidx] = min(abs(temp_delta(:)));
        [xidx,yidx] = ind2sub(tunes_size, temp_tunesidx);   

        tunes_harmonic(xidx, yidx, 1) = tunes_harmonic(xidx, yidx, 1) + 1;
        for k = 2: 1: maximum_harmonic
            if (base_fre_idx - max_error_idx) * k > 0
                k_amp = max(abs_fft_amp(round((base_fre_idx - max_error_idx) * k): round((base_fre_idx + max_error_idx) * k)));
            else
                k_amp = max(abs_fft_amp(1: round((base_fre_idx + max_error_idx) * k)));
            end
            tunes_harmonic(xidx, yidx, k) = tunes_harmonic(xidx, yidx, k) + k_amp / base_fre_amp;
        end

    %     figure(2);
    %     plot(linspace(0, length(clip) - 1, length(clip)) / length(clip) * fs, abs_fft_amp);
    %     hold on
    %     scatter(base_fre_idx / length(clip) * fs, abs_fft_amp(base_fre_idx), 20, 'ro');
    %     hold off
        waitbar(i / (length(real_idx) + 1), bar, 'Getting the frequency of each tone ...');
    end
    close(bar);
    first_nonzero_idx = 0;
    for i = 1: 1: tunes_size(1)
        for j = 1: 1: tunes_size(2)
            if tunes_harmonic(i, j, 1) ~= 0
                if first_nonzero_idx == 0
                    first_nonzero_idx = (i - 1) * tunes_size(2) + j - 1;
                end
                tunes_harmonic(i, j, :) = tunes_harmonic(i, j, :) / tunes_harmonic(i, j, 1);
            end
        end
    end
    
    % for tunes that are not in the wav, use the nearest tunes harmonic
    % instead
    nonzero_idx = zeros(tunes_size(1) * tunes_size(2), 1);
    for i = 1: 1: tunes_size(1)
        for j = 1: 1: tunes_size(2)
            if tunes_harmonic(i, j, 1) ~= 0
                nonzero_idx((i - 1) * tunes_size(2) + j) = (i - 1) * tunes_size(2) + j - 1;
            end
        end
    end
    
    for i = 1: 1: tunes_size(1)
        for j = 1: 1: tunes_size(2)
            if tunes_harmonic(i, j, 1) == 0
                distance = abs(nonzero_idx - ((i - 1) * tunes_size(2) + (j - 1)));
                distance(distance == (i - 1) * tunes_size(2) + (j - 1)) = inf;
                [temp_min, temp_distance_idx] = min(distance);
                tunes_harmonic(i, j, :) = tunes_harmonic(floor((temp_distance_idx - 1) / tunes_size(2)) + 1, mod(temp_distance_idx - 1, tunes_size(2)) + 1, :);
            end
        end
    end
end

