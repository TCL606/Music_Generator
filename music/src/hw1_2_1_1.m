clear all, close all, clc;

base = [220, 440, 880]';
power = linspace(0, 1 - 1/12, 12);
rate = 2.^power;
tunes = base * rate;

fs = 8e3;
song = [
    tunes(3, 1), 1;
    tunes(3, 1), 0.5;
    tunes(3, 3), 0.5;
    tunes(2, 8), 2;
    tunes(2, 6), 1;
    tunes(2, 6), 0.5;
    tunes(2, 3), 0.5;
    tunes(2, 8), 2;
];

beat = 0.5;
melody = [];
for i = 1: 1: size(song)
    t = linspace(0, song(i, 2) * beat , song(i, 2) * fs * beat)';
    sub_melody = sin(2 * pi * song(i, 1) .* t);
    melody = [melody; sub_melody];
end

plot([0 : length(melody) - 1] / fs, melody);
sound(melody, fs);
audiowrite('hw_1_2_1_1.wav', melody, fs);
