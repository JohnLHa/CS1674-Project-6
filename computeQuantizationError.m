function [ error ] = computeQuantizationError( origImg, quantizedImg )
%COMPUTEQUANTIZATIONERROR Summary of this function goes here
%  computes errors in quantization

[r,c,z] = size(origImg);
error =0;

for i=1:r
    for j=1:c
        for k=1:z
            error= error + sqrt(sum((origImg(i,j,k)-quantizedImg(i,j,k)) .^ 2));
        end
    end
end


end

