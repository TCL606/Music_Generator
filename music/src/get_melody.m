function [melody] = get_melody(tunes, tunes_harmonic, fs, song, beat)
    melody = [];
    for i = 1: 1: length(song)
        time = song(i, 3) * beat;
        if song(i, 1) == 0 || song(i, 2) == 0
            sub_melody = zeros(round(time * fs), 1);
        else
            base_fre = tunes(song(i, 1), song(i, 2));
            if i ~= 1
                shiftTime = 0.05;
                shiftLen = round(shiftTime * fs);
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

        melLen = length(melody);
        subLen = length(sub_melody);
        if i ~= 1 && melLen - shiftLen >= 0
            if shiftLen < subLen
                melody = [
                    melody(1: melLen - shiftLen); 
                    melody(melLen - shiftLen + 1: melLen) + sub_melody(1: shiftLen);
                    sub_melody(shiftLen + 1: subLen) 
                ];
            else
                 melody = [
                    melody(1: melLen - shiftLen); 
                    melody(melLen - shiftLen + 1: melLen) + sub_melody(1: subLen);
                ];
            end
        else
            melody = [melody; sub_melody];
        end
    end
end

