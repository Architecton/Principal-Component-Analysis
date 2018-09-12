% compress_image(image_name, num_singular_values)
%
% Compress image with name image_name using singular value decomposition by
% keeping only the number of singular values specified by num_singular_values argument. 
% The function returns the two matrices needed to reconstruct the original
% image and the compression ratio achieved (ratio of number of elements in
% matrices).
%
% Author: Jernej Vivod
%
function [M1, M2, compression_ratio] = compress_image(image_name, num_singular_values)
	im = imread(image_name);	% Read image.
	im = im(:,:,1);				% Remove third dimension.
	im = double(im);
	[U E V] = svd(im);			% Perform SVD.
	% Approximate original image with a lower rank matrix.
	M1 = U * E(:,1:num_singular_values);	% Matrices needed to reconstruct the image
	M2 = V(:,1:num_singular_values)';
	
	% Compute compression ratio.
	original_size = numel(im);
	compressed_size = numel(M1) + numel(M2);
	compression_ratio = compressed_size / original_size;
	
end