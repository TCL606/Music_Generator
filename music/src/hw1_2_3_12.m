clear all, close all, clc;

%wavpath = "..//音乐合成所需资源//fmt.wav";
wavpath = "..//resource//sky.wav";
base = [55, 110, 220, 440, 880]';
interval = 4000;
maximum_harmonic = 7;
piece = 1 / 5;
[tunes, tunes_harmonic, fs] = analyse_tunes(wavpath, piece, base, interval, maximum_harmonic);
file = loadjson('../resource/left.json');
song = file.song;
% song = [    
%     [0, 0, 0.5];
%     [2, 6, 0.25];
%     [2, 4, 0.25];
%     [2, 6, 0.75];
%     [2, 4, 0.25];
%     [2, 6, 0.25];
%     [3, 1, 0.5];
%     [2, 8, 1];
%     [0, 0, 0.25];
%     
%     [0, 0, 0.25];
%     [2, 6, 0.25];
%     [2, 6, 0.25];
%     [2, 4, 0.25];
%     [2, 6, 0.25];
%     [2, 9, 0.5];
%     [2, 11, 0.25];
%     [3, 1, 1];
%     [0, 0, 1];
%     
%     [0, 0, 0.25];
%     [2, 6, 0.25];
%     [2, 11, 0.25];
%     [3, 1, 0.25];
%     [3, 2, 0.25];
%     [3, 1, 0.5];
%     [2, 6, 0.25];
%     [2, 11, 0.75];
%     [2, 4, 0.5];
%     [0, 0, 0.5];
%     [2, 4, 0.25];
%     
%     [2, 3, 0.75];
%     [2, 8, 0.75];
%     [2, 9, 0.25];
%     [2, 8, 1.25];
%     [0, 0, 1];
%     
%     [0, 0, 0.5];
%     [2, 6, 0.25];
%     [2, 4, 0.25];
%     [2, 6, 0.75];
%     [2, 4, 0.25];
%     [2, 6, 0.25];
%     [3, 1, 0.5];
%     [2, 8, 1];
%     [0, 0, 0.25];
%     
%     [0, 0, 0.25];
%     [2, 6, 0.25];
%     [2, 6, 0.25];
%     [2, 4, 0.25];
%     [2, 6, 0.25];
%     [2, 9, 0.5];
%     [2, 11, 0.25];
%     [3, 4, 1.25];
%     [2, 11, 0.5];
%     [2, 9, 0.5];
%    
%     [0, 0, 0.5];
%     [2, 6, 0.25];
%     [2, 11, 0.25];
%     [3, 1, 0.5];
%     [2, 6, 0.25];
%     [2, 8, 0.75];
%     [2, 4, 0.5];
%     [0, 0, 0.5];
%     [2, 1, 0.25];
%     
%     [2, 8, 1.5];
%     [2, 9, 0.25];
%     [2, 9, 1.5];
%     [0, 0, 0.5];
%     [2, 9, 0.5];
%     [2, 8, 0.25];
%     
%     [2, 6, 0.75];
%     [3, 6, 0.75];
%     [3, 4, 0.25];
%     [2, 11, 1.25];
%     [0, 0, 0.5];
%     [2, 8, 0.25];
%     [2, 9, 0.25];
%     
%     [2, 4, 0.75];
%     [3, 4, 0.75];
%     [2, 8, 0.5];
%     [2, 9, 0.5];
%     [2, 8, 0.25];
%     [2, 6, 0.25];
%     [0, 0, 0.5];
%     [2, 9, 0.25];
%     [2, 8, 0.25];
%     [2, 6, 0.75];
%     [3, 6, 0.75];
%     [3, 4, 0.25];
%     [3, 4, 0.75];
%     [3, 1, 0.25];
%     [2, 11, 0.25];
%     [2, 9, 0.5];
%     [2, 8, 1.25];
%     % ==
%     [0, 0, 0.25];
%     [3, 2, 0.5];
%     [3, 1, 1.25];
%     [0, 0, 0.5];
%     [2, 9, 0.25];
%     [2, 11, 0.25];
%     
%     [3, 6, 0.75];
%     [3, 1, 0.75];
%     [2, 11, 0.25];
%     [3, 4, 1.25];
%     [0, 0, 0.25];
%     [2, 9, 0.25];
%     [2, 8, 0.25];
%     
%     [2, 6, 0.75];
%     [3, 9, 0.75];
%     [3, 8, 0.25];
%     [3, 1, 1];
%     [0, 0, 0.5];
%     [2, 11, 0.25];
%     [2, 9, 0.25];
%     
%     [2, 6, 0.25];
%     [2, 9, 0.25];
%     [2, 11, 0.25];
%     [3, 1, 0.25];
%     [2, 11, 0.25];
%     [3, 6, 0.25];
%     [3, 4, 0.25];
%     [3, 1, 0.25];
%     [2, 11, 0.75];
%     [3, 1, 0.5];
%     [3, 6, 0.75];
%     
%     [3, 2, 1.25];
%     [3, 6, 0.5];
%     [3, 5, 1.25];
%     [0, 0, 0.5];
%     [2, 9, 0.25];
%     [2, 11, 0.25];
%     
%     [3, 6, 0.75];
%     [3, 1, 0.75];
%     [2, 11, 0.25];
%     [3, 4, 1.25];
%     [0, 0, 0.5];
%     [2, 9, 0.25];
%     [2, 8, 0.25];
%     
%     [2, 6, 0.75];
%     [3, 9, 0.75];
%     [3, 8, 0.5];
%     [3, 1, 1];
%     [0, 0, 0.5];
%     [2, 11, 0.25];
%     [2, 9, 0.25];
%     
%     [2, 6, 1];
%     [3, 1, 1];
%     [2, 8, 1];
%     [3, 4, 1];
%     [3, 2, 0.5];
%     [3, 1, 0.25];
%     [2, 9, 1.25];
%     [2, 11, 1];
%     [2, 8, 0.75];
%     
%     [2, 6, 2];
%     [0, 0, 2];
% ];

beat = 1 / 0.733;

melody = get_melody(tunes, tunes_harmonic, fs, song, beat);

figure(2);
plot([0 : length(melody) - 1] / fs, melody);
set(gca, 'XLim', [0  (length(melody) - 1) / fs]);
set(gca, 'YLim', [-1.5 1.5]);
sound(melody, fs);
audiowrite('hw_1_2_3_12.wav', melody, fs);
