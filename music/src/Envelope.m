function scale = Envelope(t)
    len = length(t);
    
    x1 = len / 100;
    cof = inv([x1^2, x1; 2*x1, 1]) * [1,0]';
    
    a = 20; % 20
    b = 0.0018;
    shift = len ;
    
    delta = 0.05;
    
    f1 = @(x)(cof(1) * x.^2 + cof(2) .* x) .* (x < x1);
    f2 = @(x)(1 ./ (1 + a .* exp(b .* (x - shift))) - delta / len .* x) .* (x >= x1);
    
%     li = linspace(1, len, len);
%     scale = f1(li) + f2(li);
    
%     li = linspace(1, len, len) / len * 15;
%     scale = chi2pdf(li,4);
%     scale = scale / max(scale);
    
    li = linspace(1, len, len) / len * 20 / 3;  
    exp_a = 1;
    exp_b = 4;
    exp_c = 0.5;
    scale = (exp_b * li).^exp_c .* exp(-exp_a * li);
    scale = scale / max(scale);
end

