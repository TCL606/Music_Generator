clear all, close all, clc;

wavpath = "..//音乐合成所需资源//fmt.wav";
base = [110, 220, 440, 880]';
[tunes, tunes_harmonic] = analyse_tunes(wavpath, 1, base, 500, 10);

fs = 8e3;   
song = [    % lower octave
    [3, 1, 1];
    [3, 1, 0.5];
    [3, 3, 0.5];
    [2, 8, 2];
    [2, 6, 1];
    [2, 6, 0.5];
    [2, 3, 0.5];
    [2, 8, 2];
];

beat = 0.5;
melody = [];
for i = 1: 1: length(song)
    time = song(i, 3) * beat;
    if song(i, 1) == 0 || song(i, 2) == 0
        sub_melody = 0;
    else
        base_fre = tunes(song(i, 1), song(i, 2));
        if i ~= 1
            shiftTime = 0.08;
            shiftLen = shiftTime * fs;
            t = linspace(0, time + shiftTime, time * fs + shiftLen)';
            sub_melody = sin(2 * pi * base_fre .* t);
            for j = 2: 1: length(tunes_harmonic(1, 1, :))
                sub_melody = sub_melody + tunes_harmonic(song(i, 1), song(i, 2), j) * sin(2 * pi * base_fre .* t * j);
            end
            scale = Envelope(sub_melody);
            sub_melody = sub_melody .* scale';
        else
            t = linspace(0, time , time * fs)';
            sub_melody = sin(2 * pi * base_fre .* t);
            for j = 2: 1: length(tunes_harmonic(1, 1, :))
                sub_melody = sub_melody + tunes_harmonic(song(i, 1), song(i, 2), j) * sin(2 * pi * base_fre .* t * j);
            end
            scale = Envelope(sub_melody);
            sub_melody = sub_melody .* scale';
        end
    end 
    
    if i ~= 1
        melLen = length(melody);
        subLen = length(sub_melody);
        melody = [
            melody(1:melLen - shiftLen); 
            melody(melLen - shiftLen + 1: melLen) + sub_melody(1: shiftLen);
            sub_melody(shiftLen + 1: subLen) 
        ];
    else
        melody = [melody; sub_melody];
    end
end

figure(2);
plot([0 : length(melody) - 1] / fs, melody);
sound(melody, fs);
audiowrite('hw_1_2_3_11.wav', melody, fs);