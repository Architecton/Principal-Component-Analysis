% A simple example of computing the Mahalanobis distance of a measurement.

% Define a matrix of 6 samples with 2 measurements.
measurements = [1 2; 3 2; 5 4; 6 5; 2 2; 1 1];
% Compute the covariance matrix of the measurements.
C = cov(measurements);

% Define a new measurement and center it by subtracting the mean of the
% measurements from it.
test_measurement = [2 3];
centered_test_measurement = test_measurement - mean(measurements);

% Compute mahalanobis distance. Notice that the test_measurement is
% considered to by a column vector by the original formula.
mahalanobis = centered_test_measurement/C * centered_test_measurement'