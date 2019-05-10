function [W, H, cost] = nmf(V, k, iteration_time, lambda)

    W = rand(size(V, 1), k);
    H = rand(k, size(V, 2));

    cost = zeros(1, iteration_time);


    % for i = 1:iteration_time
    %     i
    %     LW = W;
    %     LH = H;

    %     T = LW * LH;

    %     W = (V * (LH')) ./ (T * (LH')) .* LW;
    %     H = ((LW') * V) ./ ((LW') * T) .* LH;
    %     cost(i) = norm((V - W * H) .^ 2, 1) / size(V, 1) / size(V , 2) ;
    %     % V - W * H
    %     % pause
    %     cost(i)
    %     % pause
    %     if cost(i) < 1e-5
    %         break
    %     end
    % end

    for i = 1:iteration_time
        i
        LW = W;
        LH = H;

        T = LW * LH;
        % max(max(LW ./ (T * (LH'))))
        % pause
        W = LW + lambda * (V * (LH') - T * (LH'));
        H = LH + lambda * ((LW') * V - (LW') * T);

        cost(i) = norm((V - W * H) .^ 2, 1) / size(V, 1) / size(V , 2);
        cost(i)
        if(cost(i) < 1e-5)
            break;
        end
end
