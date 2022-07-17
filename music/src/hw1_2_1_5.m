clear all, close all, clc;

base = [220, 440, 880]';
power = linspace(0, 1 - 1/12, 12);
rate = 2.^power;
tunes = base * rate;
fs = 8e3;

beat = 1 / 0.733;
song = [
    0, 0.5;
    tunes(2, 6), 0.25;
    tunes(2, 4), 0.25;
    tunes(2, 6), 0.75;
    tunes(2, 4), 0.25;
    tunes(2, 6), 0.25;
    tunes(3, 1), 0.5;
    tunes(2, 8), 1;
    0, 0.25;
    
    0, 0.25;
    tunes(2, 6), 0.25;
    tunes(2, 6), 0.25;
    tunes(2, 4), 0.25;
    tunes(2, 6), 0.25;
    tunes(2, 9), 0.5;
    tunes(2, 11), 0.25;
    tunes(3, 1), 1;
    0, 1;
    
    0, 0.25;
    tunes(2, 6), 0.25;
    tunes(2, 11), 0.25;
    tunes(3, 1), 0.25;
    tunes(3, 2), 0.25;
    tunes(3, 1), 0.5;
    tunes(2, 6), 0.25;
    tunes(2, 11), 0.75;
    tunes(2, 4), 0.5;
    0, 0.5;
    tunes(2, 4), 0.25;
    
    tunes(2, 3), 0.75;
    tunes(2, 8), 0.75;
    tunes(2, 9), 0.25;
    tunes(2, 8), 1.25;
    0, 1;
    
    0, 0.5;
    tunes(2, 6), 0.25;
    tunes(2, 4), 0.25;
    tunes(2, 6), 0.75;
    tunes(2, 4), 0.25;
    tunes(2, 6), 0.25;
    tunes(3, 1), 0.5;
    tunes(2, 8), 1;
    0, 0.25;
    
    0, 0.25;
    tunes(2, 6), 0.25;
    tunes(2, 6), 0.25;
    tunes(2, 4), 0.25;
    tunes(2, 6), 0.25;
    tunes(2, 9), 0.5;
    tunes(2, 11), 0.25;
    tunes(3, 4), 1.25;
    tunes(2, 11), 0.5;
    tunes(2, 9), 0.5;
   
    0, 0.5;
    tunes(2, 6), 0.25;
    tunes(2, 11), 0.25;
    tunes(3, 1), 0.5;
    tunes(2, 6), 0.25;
    tunes(2, 8), 0.75;
    tunes(2, 4), 0.5;
    0, 0.5;
    tunes(2, 1), 0.25;
    
    tunes(2, 8), 1.5;
    tunes(2, 9), 0.25;
    tunes(2, 9), 1.5;
    0, 0.5;
    tunes(2, 9), 0.5;
    tunes(2, 8), 0.25;
    
    tunes(2, 6), 0.75;
    tunes(3, 6), 0.75;
    tunes(3, 4), 0.25;
    tunes(2, 11), 1.25;
    0, 0.5;
    tunes(2, 8), 0.25;
    tunes(2, 9), 0.25;
    
    tunes(2, 4), 0.75;
    tunes(3, 4), 0.75;
    tunes(2, 8), 0.5;
    tunes(2, 9), 0.5;
    tunes(2, 8), 0.25;
    tunes(2, 6), 0.25;
    0, 0.5;
    tunes(2, 9), 0.25;
    tunes(2, 8), 0.25;
    tunes(2, 6), 0.75;
    tunes(3, 6), 0.75;
    tunes(3, 4), 0.25;
    tunes(3, 4), 0.75;
    tunes(3, 1), 0.25;
    tunes(2, 11), 0.25;
    tunes(2, 9), 0.5;
    tunes(2, 8), 1.25;
    % ==
    0, 0.25;
    tunes(3, 2), 0.5;
    tunes(3, 1), 1.25;
    0, 0.5;
    tunes(2, 9), 0.25;
    tunes(2, 11), 0.25;
    
    tunes(3, 6), 0.75;
    tunes(3, 1), 0.75;
    tunes(2, 11), 0.25;
    tunes(3, 4), 1.25;
    0, 0.25;
    tunes(2, 9), 0.25;
    tunes(2, 8), 0.25;
    
    tunes(2, 6), 0.75;
    tunes(3, 9), 0.75;
    tunes(3, 8), 0.25;
    tunes(3, 1), 1;
    0, 0.5;
    tunes(2, 11), 0.25;
    tunes(2, 9), 0.25;
    
    tunes(2, 6), 0.25;
    tunes(2, 9), 0.25;
    tunes(2, 11), 0.25;
    tunes(3, 1), 0.25;
    tunes(2, 11), 0.25;
    tunes(3, 6), 0.25;
    tunes(3, 4), 0.25;
    tunes(3, 1), 0.25;
    tunes(2, 11), 0.75;
    tunes(3, 1), 0.5;
    tunes(3, 6), 0.75;
    
    tunes(3, 2), 1.25;
    tunes(3, 6), 0.5;
    tunes(3, 5), 1.25;
    0, 0.5;
    tunes(2, 9), 0.25;
    tunes(2, 11), 0.25;
    
    tunes(3, 6), 0.75;
    tunes(3, 1), 0.75;
    tunes(2, 11), 0.25;
    tunes(3, 4), 1.25;
    0, 0.5;
    tunes(2, 9), 0.25;
    tunes(2, 8), 0.25;
    
    tunes(2, 6), 0.75;
    tunes(3, 9), 0.75;
    tunes(3, 8), 0.5;
    tunes(3, 1), 1;
    0, 0.5;
    tunes(2, 11), 0.25;
    tunes(2, 9), 0.25;
    
    tunes(2, 6), 1;
    tunes(3, 1), 1;
    tunes(2, 8), 1;
    tunes(3, 4), 1;
    tunes(3, 2), 0.5;
    tunes(3, 1), 0.25;
    tunes(2, 9), 1.25;
    tunes(2, 11), 1;
    tunes(2, 8), 0.75;
    
    tunes(2, 6), 2;
    0, 2;
];

melody = [];
for i = 1: 1: length(song)
    time = song(i, 2) * beat;
    if i ~= 1
        shiftTime = 0.08;
        shiftLen = shiftTime * fs;
        t = linspace(-shiftTime, time , time * fs + shiftLen)';
        sub_melody = sin(2 * pi * song(i, 1) .* t) + 0.1 * sin(2 * pi * song(i, 1) .* t * 2);
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
        sub_melody = sin(2 * pi * song(i, 1) .* t) + 0.1 * sin(2 * pi * song(i, 1) .* t * 2);
        scale = Envelope(sub_melody);
        sub_melody = sub_melody .* scale';
        if max(sub_melody) ~= 0
            sub_melody = sub_melody / max(sub_melody);
        end
        melody = [melody; sub_melody];
    end
        
end

plot([0 : length(melody) - 1] / fs, melody);
sound(melody, fs);
audiowrite('hw_1_2_1_5.wav', melody, fs);
