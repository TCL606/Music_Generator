clear all, close all, clc;

wavpath = "..//音乐合成所需资源//fmt.wav";
base = [110, 220, 440, 880]';
[tunes, tunes_harmonic] = analyse_tunes(wavpath, base);
