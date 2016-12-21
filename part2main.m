im = imread('jupiter.jpg');
%Reads in image and finds edges and circles

edges = detectEdges(im, 100);
centers = detectCircles(im, edges, 10, 10);
saveas(gcf,'CirclesFoundJupiter.jpg');

im2 = imread('egg.jpg');
edges2 = detectEdges(im2, 100);
centers2 = detectCircles(im2, edges2, 10, 10);
saveas(gcf,'CirclesFoundEgg.jpg');
