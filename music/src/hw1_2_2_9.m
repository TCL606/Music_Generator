clear all, close all, clc;

wavpath = "..//音乐合成所需资源//fmt.wav";
base = [110, 220, 440, 880]';
interval = 500;
maximum_harmonic = 7;
piece = 1;
[tunes, tunes_harmonic] = analyse_tunes(wavpath, piece, base, interval, maximum_harmonic, 1);
