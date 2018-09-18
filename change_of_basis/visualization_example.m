% Load and plot data from the data matrix.
data = load('data.mat');
A = data.A;
figure;
scatter(A(:, 1), A(:, 2), 50, '.');

% Get SVD results.
[U Sig V] = svd(A);

% Visualize basis axis

% // The Basis of Right Singular Vectors /////////////////////////////////
line(10.*[0, V(1, 1)], 10.*[0, V(2, 1)], 'Color', 'red', 'LineWidth', 0.9)
line(-15.*[0, V(1, 1)], -15.*[0, V(2, 1)], 'Color', 'red', 'LineWidth', 0.9)

line(5.*[0, V(1, 2)], 5.*[0, V(2, 2)], 'Color', 'red', 'LineWidth', 0.9)
line(-5.*[0, V(1, 2)], -5.*[0, V(2, 2)], 'Color', 'red', 'LineWidth', 0.9)
% ////////////////////////////////////////////////////////////////////////


% // The Standard Basis /////////////////////////////////
line(10.*[0, 1], 10.*[0, 0], 'Color', 'black', 'LineWidth', 0.9)
line(-15.*[0, 1], -15.*[0, 0], 'Color', 'black', 'LineWidth', 0.9)

line(5.*[0, 0], 5.*[0, 1], 'Color', 'black', 'LineWidth', 0.9)
line(-5.*[0, 0], -5.*[0, 1], 'Color', 'black', 'LineWidth', 0.9)
% ////////////////////////////////////////////////////////////////////////

% Grid and hold
grid on
hold on;

% Define a point using the standard basis vectors.
test_point = [-10; 0];

% Plot the point in the standard basis.
plot(test_point(1), test_point(2), 'o', 'LineWidth', 1, 'Color', 'red')

% Change basis to basis of right singular vectors.
% The columns of V' (inverse of V, since it is orthogonal) represent how
% the standard basis vectors would be written in the basis of right
% singular vectors, since the standard basis vectors are the vectors that
% form the linear combinarion to yield this point.
transformed_test_point = V' * test_point;

% ALSO:
% ////////////
% transformed_test_point = test_point' * V;
% ////////////
%
% Compute the dot product of test_point with each right singular vector.
%

% Plot the transformed point.
plot(transformed_test_point(1), transformed_test_point(2), 'o', 'LineWidth', 1, 'Color', 'green')