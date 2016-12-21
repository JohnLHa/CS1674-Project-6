function [ outputImg, meanColors, clusterIds ] = quantizeRGB(origImg, k)
%QUANTIZERGB Summary of this function goes here
%   Quantize the RGB

im = double(origImg);
rows = size(im,1);
columns = size(im, 2);
numpixels = rows * columns;
im = reshape(im,numpixels, 3);

[clusterIds, meanColors] = kmeans(im, k);
pixelLoc = reshape(clusterIds, rows, columns);
outputImg = uint8(reshape(im,[rows,columns,3]));

for i=1:rows
    for j=1:columns
        for num=1:k
            if pixelLoc(i,j)==num
                outputImg(i,j,1)=meanColors(num,1);
                outputImg(i,j,2)= meanColors(num,2);
                outputImg(i,j,3)= meanColors(num,3);
            end
        end
    end
end

end

