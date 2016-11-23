function [ centers ] = detectCircles( im, edges, r, top_k )
%DETECTCIRCLES Summary of this function goes here
%   Detailed explanation goes here
quant = 5;
[x,y,~] = size(im);
[numEdges,~] = size(edges);
H=zeros(x,y);

for i=1:numEdges
    a = abs(ceil(edges(i,2)-r * cos(edges(i,4))))+1;
    b = abs(ceil(edges(i,1)-r * sin(edges(i,4))))+1;
    a=ceil(a/quant);
    b=ceil(b/quant);
    
    H(a,b) = H(a,b)+1;
end

[B,I] = sort(H(:), 'descend');
[rows, columns] = ind2sub(size(H), I(1:top_k));

for i=1:top_k
    centers(i, 1) = rows(i) * quant;
    centers(i, 2) = columns(i) * quant;
end

figure; imshow(im); 
title(['Radius r set to: ' r]);
viscircles(centers, r * ones(size(centers, 1), 1));

end
