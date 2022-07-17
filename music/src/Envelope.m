function scale = Envelope(t, shiftLen)
    len = length(t);
    
%     li = linspace(1, len, len) / len * 15;
%     scale = chi2pdf(li,4);
%     scale = scale / max(scale);
    if(~exist('shiftLen','var'))
        shiftLen = 0;
    end
    li = linspace(-shiftLen + 1, len, len) / len * 20 / 3;  
    exp_a = 1;
    exp_b = 4;
    exp_c = 0.5;
    scale = (exp_b * li).^exp_c .* exp(-exp_a * li);
    scale = scale / max(scale);

end

