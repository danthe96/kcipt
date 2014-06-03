function run_kcit_postnonlinear()
    addpath('gpml-matlab/gpml');
    addpath('algorithms');
    addpath('data');
    addpath('experiments');
    for noise=0:4
        for trial=0:299
            for independent=0:1
                for N=[200 400]
                    kcit_postnonlinear(independent, noise, trial, N, 'results/kcit_postnonlinear.csv');
                end
            end
        end
    end
end
