% load example data set of measurements of flowers
load fisheriris;
% display current variables
whos

% Let X be the data matrix and assign it the values of the measuremenets matrix
X = meas;

% plot a histogram of the first measurement for all flowers
figure; hist(X(:, 1));
% plot a scatterplot for the first two measurements
figure; plot(X(:, 1), X(:, 2), '.');

% compute PCA based on the eigendecomposition ///

% compute the covariance matrix
C = X'*X
% compute the eigenvalue decomposition of the covariance matrix
[W, Lambda] = eig(C);
% the largest eigenvalue is the last onenormest
% we want to reorder the principal components
% flip the matrix W and the matrix Lambda
W = W(:, end:-1:1);
Lambda = Lambda(:, end:-1:1);
% ////////////////////////////////////////////////

% computing the PCA using the SVD ///
[U, Sig, V] = svd(X);
% The matrices V and W are equivalent (the signs are arbitrary)
% (W is actually -V)

% ////////////////////////////////////

% projecting the measurements onto two dimensions
% pick r == 2

% V_r contains the first two columns of V, the matrix of principal components
V_r = V(:, 1:2);

% project the data onto the principal components in V_r
a = meas * V_r;

% same numbers of flowers with two values explaining each of them
size(a)

% We can now create a scatterplot of the projected data
figure; plot(a(:, 1), a(:, 2), '.');
% label the axis
xlabel("PC1"); ylabel("PC2");

% look at the values of the singular values
% By looking at the relative values we can asses how many singular vectors we need to keep
% to sufficiently explain the data

% get the singular values into a vectorize
sv = diag(Sig)

% they will be orderd in descending order (rows)

figure; stairs(cumsum(sv)/sum(sv));
% We can see that the first two principal components explain the vast majority of the data



% The original dataset contains three flowers
% plot the projected data as a scatter plot
% as the categorical function is not yet implemented in Octave, compute a color mask
col_mask = get_color_mask(species);
figure; scatter(a(:, 1), a(:, 2), 30, col_mask);
xlabel("PC1"); ylabel("PC2"); title("Representing the fisheriris Data Using the First Two Principal Components");