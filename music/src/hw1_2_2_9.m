clear all, close all, clc;

[x, fs] = audioread("..//音乐合成所需资源//fmt.wav");
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

dif = y5(2: end) - y5(1: end - 1);
idx = [];
i = 2;
while i <= length(dif)
    if dif(i) * dif(i - 1) < 0
        idx = [idx; i];
        i = i + 500;
    else
        i = i + 1;
    end
end

threshold_interval = fs / 8; 
choose_idx = zeros(length(idx), 1) ~= 0;
choose_idx(1) = 1;
i = 2;
while i <= length(idx)  
    if abs(idx(i) - idx(i - 1)) >= threshold_interval
        choose_idx(i) = true;
    else 
        if y5(idx(i)) > y5(idx(i - 1))      % Choose the ones with higher amplitude first
            choose_idx(i) = true;
            choose_idx(i - 1) = false;
        else
            choose_idx(i) = false;
            choose_idx(i - 1) = true;
        end
    end
    i = i + 1;
end
real_idx = idx(choose_idx);

subplot(6, 1, 6);
hold on
scatter((real_idx - 1) / fs, y5(real_idx), 20, 'ro');
hold off
subplot(6, 1, 1);
hold on
scatter((real_idx - 1) / fs, zeros([length(real_idx), 1]), 20, 'y', 'filled');
hold off

for i = 1: 1: length(real_idx)
    if i == 1
    elseif i == length(real_idx)
    else
          clip = x(real_idx(i - 1), real_idx(i));
    end
end

