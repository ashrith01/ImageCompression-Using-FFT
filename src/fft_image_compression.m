function fft_image_compression(image_path)
%FFT_IMAGE_COMPRESSION Demonstrate lossy image compression with the 2-D FFT.
%   fft_image_compression("path/to/image.jpg") keeps coefficients above a
%   series of magnitude thresholds and displays the reconstructed images.

if nargin ~= 1
    error('Provide one image path, for example: fft_image_compression("image.jpg")');
end

if ~isfile(image_path)
    error('Input image not found: %s', image_path);
end

close all;
input_image = imread(image_path);

figure(1);
imshow(input_image);
title('Original image');

disp('Computing the two-dimensional Fourier transform...');
frequency_coefficients = fft2(input_image);
centered_spectrum = fftshift(fftshift(frequency_coefficients, 1), 2);
display_spectrum = mat2gray(log(abs(centered_spectrum) + 1));

figure(2);
imshow(display_spectrum, []);
title('Log-magnitude FFT spectrum');

threshold_factors = 0.1 * [0.001, 0.005, 0.008, 0.009, 0.01];
maximum_magnitude = max(abs(frequency_coefficients(:)));

figure(3);
subplot(2, 3, 1);
imshow(input_image);
title('Original image');

for index = 1:numel(threshold_factors)
    threshold = threshold_factors(index) * maximum_magnitude;
    retained_mask = abs(frequency_coefficients) > threshold;
    filtered_coefficients = frequency_coefficients .* retained_mask;
    retained_percent = 100 * nnz(retained_mask) / numel(retained_mask);
    reconstructed_image = real(ifft2(filtered_coefficients));

    subplot(2, 3, index + 1);
    imshow(uint8(reconstructed_image));
    title(sprintf('%.2f%% retained', retained_percent));
end
end
