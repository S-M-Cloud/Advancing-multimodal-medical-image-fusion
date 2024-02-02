function result = GuidanceFilter1(Image_input1)

% Image_edges=edge(Image_input1,'canny',.03); %.03
% 
% Image_guidance = imdilate(Image_edges, strel('disk',1));
% Image_guidance = bwareaopen(Image_guidance, 50);
% smoothValue  = .001*diff(getrangefromclass(Image_guidance)).^2;  %0.001

% kamel  result=imguidedfilter(Image_input1,Image_guidance,NeighborhoodSize=[5 5],DegreeOfSmoothing=smoothValue);

[Gmag,Gdir] = imgradient(Image_input1,'central');
%result=imguidedfilter(Gdir);result=imguidedfilter(Image_input1,Image_input1-Gdir);
result=imguidedfilter(Image_input1,Image_input1-Gmag);


end



%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ code kamel
% function result = GuidanceFilter1(Image_CT)
% % clear all; close all; clc;
% % Image_CT=imread('\\filer3.usask.ca\s\shm153\Desktop\shiva\Image fusion\DataSet\MRI-003.jpg');
% Image_edges=edge(Image_CT,'canny',.03);
% Image_guidance = imdilate(Image_edges, strel('disk',1));
% Image_guidance = bwareaopen(Image_guidance, 50);
% % Image_guidance = ~Image_guidance;
% % result=imguidedfilter(Image_CT,Image_guidance);  %,DegreeOfSmoothing=4
%  result=imguidedfilter(Image_CT);
% 
% end