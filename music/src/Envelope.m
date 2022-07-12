function scale = Envelope(t)
    len = length(t);
    
    slope = 200;
    alpha = -0.001;
    
    u1 = @(x)x < len / slope;
    u2 = @(x)x >= len / slope & x < len / 2;
    u3 = @(x)x >= len /2;
    
    f1 = @(x)200 / len .* x .* u1(x);
    f2 = @(x)u2(x);
    f3 = @(x)exp(alpha * (x - len / 2)) .* u3(x);
    
    li = linspace(1, len, len);
    scale = f1(li) + f2(li) + f3(li);
end

