function F1 = walk(p1, Y, alpha, F1)
    diff_norm = 10;
    while diff_norm > 1
        F0=F1;
        F1=alpha*p1*F0+(1-alpha)*Y;
        diff_norm = sum(sum(abs(F1 - F0)));
        diff_norm
    end
fprintf("diff_norm%f\n",diff_norm);
end