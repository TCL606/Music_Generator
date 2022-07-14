clear all, close all, clc;

audio = audioread("..//音乐合成所需资源//fmt.wav");
sound(audio, 8000);

load("..//音乐合成所需资源//Guitar.MAT");

len = length(realwave);
t = linspace(0, len / 8000, len)';
subplot(1, 2, 1);
plot(t, realwave);
title("realwave");

subplot(1, 2, 2);
plot(t, wave2proc);
title("wave2proc");