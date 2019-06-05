function [W, H, cost, delta] = nmf(V, R, r, iteration_time)
    [n m] = size(V);
    W = rand(n, r);
    H = rand(r, m);

    cost = zeros(1, iteration_time);
    delta = zeros(1, iteration_time + 1);


    for i = 2:iteration_time
        W = W .* (V * H') ./ (((W * H) .* R) * H');
        H = H .* (W' * V) ./ (W' * ((W * H) .* R));
        cost(i) = sum(sum(((W * H) .* R - V) .^ 2));
        delta(i) = cost(i - 1) - cost(i);                                                                                                   
        delta(i)
        if abs(delta(i)) < 1e-5
            break
        end
    end
end
