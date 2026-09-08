# Image Compression Using the FFT

## Overview

This MATLAB project demonstrates lossy image compression in the frequency domain. It computes a two-dimensional fast Fourier transform (FFT), discards coefficients below several magnitude thresholds, reconstructs each approximation with the inverse FFT, and shows the quality-versus-sparsity trade-off.

## How It Works

1. Read an input image.
2. Compute its two-dimensional Fourier coefficients.
3. Visualize the centered log-magnitude spectrum.
4. Apply five coefficient-magnitude thresholds.
5. Reconstruct and display one image for each threshold.

The percentage shown above each reconstruction is the share of FFT coefficients retained across all image channels.

## Repository Structure

```text
ImageCompression-Using-FFT/
├── src/
│   └── fft_image_compression.m
├── CONTRIBUTING.md
└── README.md
```

## Quick Start

### Prerequisites

- MATLAB
- Image Processing Toolbox for `imshow` and `mat2gray`
- A local image in a format supported by `imread`

### Run

From the repository root in MATLAB:

```matlab
addpath("src")
fft_image_compression("/full/path/to/image.jpg")
```

Replace the example path with your own image. The function validates that the file exists and accepts grayscale or RGB input.

## Interpreting the Output

- Figure 1 shows the original image.
- Figure 2 shows the log-magnitude FFT spectrum.
- Figure 3 compares the original with five thresholded reconstructions.

Higher thresholds retain fewer coefficients and generally increase visible information loss. This is an educational demonstration; it does not write a compressed file format or benchmark storage size.

## Contributing

Contributions that add quantitative quality metrics, saved outputs, tests, or clearer examples are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

No open-source license has been declared for this repository. The source is publicly visible for educational and reference purposes; obtain permission from the repository owner before reuse or redistribution.
