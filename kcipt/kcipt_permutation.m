function [Y_shuffled P] = kcipt_permutation(X, Y, Z, distance)
    % Performs the KCIPT with the given distance metric and null estimation
    % Parse Options
    if nargin < 4
        distance = 'rkhs';
    end

    % Compute distance
    if strcmp(distance, 'regression')
        D = regression_distance(X, Z);
    elseif strcmp(distance, 'symmetric_regression')
        D = regression_distance([X Y], Z);
    elseif strcmp(distance, 'rkhs')
        k_Z = rbf(median_pdist(Z));
        D = rkhs_distance(Z, k_Z);
    else
        error(sprintf('Unknown distance metric "%s"', distance));
    end

    % Compute permutation
    P = linear_permutation(D);
    Y_shuffled = P'*X;
end
