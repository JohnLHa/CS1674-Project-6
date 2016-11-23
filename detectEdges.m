function [ edges ] = detectEdges(im, threshold)
%DETECTEDGES Summary of this function goes here
%   Detailed explanation goes here

[r,c,z] = size(im);
newIm = double(rgb2gray(im));

[Gmag, Gdir] = imgradient(newIm);

%threshold = 2*mean(Gmag(:));

a=1;
for i=1:r
    for j=1:c
        if Gmag(i,j)>threshold
            edges(a,1) = i;
            edges(a,2) = j;
            edges(a,3) = Gmag(i,j);
            edges(a,4) = Gdir(i,j);
            a=a+1;
        end
    end
end

finalIm = zeros(r,c);
for i=1:length(edges)
    finalIm(edges(i,1), edges(i,2)) = edges(i,3);
end
figure;
imshow(finalIm)
saveas(gcf, 'EdgesFoundJupiter.jpg');

end

