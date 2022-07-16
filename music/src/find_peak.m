function [peak_val, peak_idx] = find_peak(y, interval, threshold_interval)
    dif = y(2: end) - y(1: end - 1);
    idx = [];
    i = 2;
    if interval <= 0
        interval = 1;
    end
    while i <= length(dif)
        if dif(i) * dif(i - 1) < 0
            idx = [idx; i];
            i = i + interval; 
        else
            i = i + 1;
        end
    end

    choose_idx = zeros(length(idx), 1) ~= 0;
    choose_idx(1) = 1;
    i = 2;
    while i <= length(idx)  
        if abs(idx(i) - idx(i - 1)) >= threshold_interval
            choose_idx(i) = true;
        else 
            if y(idx(i)) > y(idx(i - 1))      % Choose the ones with higher amplitude first
                choose_idx(i) = true;
                choose_idx(i - 1) = false;
            else
                choose_idx(i) = false;
                choose_idx(i - 1) = true;
            end
        end
        i = i + 1;
    end
    peak_idx = idx(choose_idx);
    peak_val = y(peak_idx);
end

