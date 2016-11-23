im = imread('fish.jpg');
[outIm1, meanColors1, clusterIds1]=quantizeRGB(im, 2);
imshow(outIm1), title('Image with K = 2'),figure; 
[outIm2, meanColors2, clusterIds2]=quantizeRGB(im, 3);
imshow(outIm2), title('Image with K = 3'),figure;
[outIm3, meanColors3, clusterIds3]=quantizeRGB(im, 4);
imshow(outIm3), title('Image with K = 4');

error1 = computeQuantizationError(im, outIm1);
error2 = computeQuantizationError(im, outIm2);
error3 = computeQuantizationError(im, outIm3);