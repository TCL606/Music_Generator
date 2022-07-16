function [tunes] = get_tunes()
    base = [220, 440, 880]';
    power = linspace(0, 1 - 1/12, 12);
    rate = 2.^power;
    tunes = base * rate;
end

