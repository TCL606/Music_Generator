clear all, close all, clc;

t = linspace(1,8000,8000) / 1500;

% a = 20;
% b = 4;
% y = (4 * t).^0.5 .* exp(-t);
% y = y / max(y);
y = Envelope(t);
plot(t, y);