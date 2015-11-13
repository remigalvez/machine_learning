function [ output_args ] = ComputeLoss( loss )
    L = zeros(size(loss, 1), 1);
    for t = 1:size(loss, 1)
        L(t) = sum(loss(t, :))/t;
    end

    output_args = L;
end

