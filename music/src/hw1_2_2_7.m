clear all, close all, clc;

load("..//音乐合成所需资源//Guitar.MAT");

len = length(realwave);
realwave_10 = resample(realwave, 10, 1);
period = zeros(len, 1);

for i = 1: 1: len
    for j = 0: 1: 9
        period(i) = period(i) + realwave_10(j * len + i);
    end
    period(i) = period(i) / 10;
end
period_10 = repmat(period, 10, 1);
w2p = resample(period_10, 1, 10);

t = linspace(0, len / 8000, len)';
subplot(1, 2, 1);
plot(t, realwave);
title("realwave");

subplot(1, 2, 2);
plot(t, w2p);
title("w2p");
