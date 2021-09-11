# Image-Quantization
Program to quantize image based on RGB and HSV channels. For this program a color space is quantized by applying k-means clustering to the
pixels in a given input image, and experimentation is done with two different color spaces—RGB and HSV.

# Examples
Input image:

![Fish](fish.jpg)

RGB and HSV Quantized images for K=5:

![Img1](Img1.JPG)

# File Summary
quantizeRGB.m: Given an RGB image, this function quantizes the 3-dimensional RGB space, and maps each pixel in the input image to its nearest k-means center.

quantizeHSV.m: Given an RGB image, this function converts it to HSV, and quantizes the 1-dimensional Hue space.

computeQuantizationError.m: This function computes the SSD error (sum of squared error) between the original RGB pixel values and the quantized values.

getHueHists.m: Given an image, this function computes and displays two histograms of its hue values.

colorQuantizeMain.m: This script calls all the above functions appropriately using the provided image fish.jpg, and displays the results.
