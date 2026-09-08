# Contributing

## Workflow

1. Create a focused branch.
2. Keep the function callable with an explicit input image path.
3. Document any changed thresholds, metrics, or output behavior.
4. Test both grayscale and RGB images when changing transform logic.
5. Include the MATLAB version and tested command in the pull request.

## MATLAB check

```matlab
addpath("src")
checkcode("src/fft_image_compression.m")
fft_image_compression("/full/path/to/test-image.jpg")
```

Do not commit private input images, MATLAB autosave files, or operating-system metadata.
