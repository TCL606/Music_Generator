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

fs = 8000;

y1 = fft(w2p(1: round(end / 10)));
L1 = length(y1);
f1 = fs * linspace(0, L1 - 1, L1) / L1;
subplot(1, 3, 1);
plot(f1, abs(y1));
title('single period');

y2 = fft(w2p);
L2 = length(y2);
f2 = fs * linspace(0, L2 - 1, L2) / L2;
subplot(1, 3, 2);
plot(f2, abs(y2));
title('10 periods');

w2p_100 = repmat(w2p, 100, 1);
y3 = fft(w2p_100);
L3 = length(y3);
f3 = fs * linspace(0, L3 - 1, L3) / L3;
subplot(1, 3, 3);
plot(f3, abs(y3));
title('1000 periods');

rep = 10 * 100;
idx = linspace(1, length(y3), length(y3));
idx = rem(idx, rep) == 1;
period_amp = abs(y3(idx));
period_amp = period_amp / period_amp(2);
figure(2);
plot([0 : length(period_amp) - 1]', period_amp);
title("amplitude");
xlabel('idx');
ylabel('relative amplitude');

disp([[0 : length(period_amp) - 1]', period_amp]);
