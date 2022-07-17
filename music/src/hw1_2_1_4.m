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
for i = 1: 1: length(song)
    time = song(i, 2) * beat;
    if i ~= 1
        shiftTime = beat / 5;
        shiftLen = shiftTime * fs;
        t = linspace(0, time + shiftTime, time * fs + shiftLen)';
        sub_melody = sin(2 * pi * song(i, 1) .* t) + 0.2 * sin(2 * pi * song(i, 1) .* t * 2) + 0.3 * sin(2 * pi * song(i, 1) .* t * 3);
        scale = Envelope(sub_melody);
        sub_melody = sub_melody .* scale';
        if max(sub_melody) ~= 0
            sub_melody = sub_melody / max(sub_melody);
        end
        melLen = length(melody);
        subLen = length(sub_melody);
        melody = [
            melody(1:melLen - shiftLen); 
            melody(melLen - shiftLen + 1: melLen) + sub_melody(1: shiftLen);
            sub_melody(shiftLen + 1: subLen) 
        ];
    else
        t = linspace(0, time , time * fs)';
        sub_melody = sin(2 * pi * song(i, 1) .* t) + 0.2 * sin(2 * pi * song(i, 1) .* t * 2) + 0.3 * sin(2 * pi * song(i, 1) .* t * 3);
        scale = Envelope(sub_melody);
        sub_melody = sub_melody .* scale';
        if max(sub_melody) ~= 0
            sub_melody = sub_melody / max(sub_melody);
        end
        melody = [melody; sub_melody];
    end
        
end
time = [0 : length(melody) - 1] / fs;
figure(1);
plot(time, melody);
figure(2);
plot(time(1: end / 200), melody(1: end / 200));
sound(melody, fs);
audiowrite('hw_1_2_1_2.wav', melody, fs);
