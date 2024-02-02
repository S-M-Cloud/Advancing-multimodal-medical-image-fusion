function [d_fs,d_cs,B] = guided2_GF_decomposition(I)

% Iteration = 2;
s = 20;  %20
r = 2; 
Ic1 = GuidanceFilter2(I);
GaussianFilter_1 = fspecial('gaussian',[2*r+1, 2*r+1],s);
Ig1 =  imfilter(I,GaussianFilter_1,'conv');
Ic2 = GuidanceFilter2(Ic1);
GaussianFilter_2 = fspecial('gaussian',[2*r+1, 2*r+1],s);
Ig2 =  imfilter(Ig1,GaussianFilter_2,'conv');
Ic3 = GuidanceFilter2(Ic2);
GaussianFilter_3 = fspecial('gaussian',[2*r+1, 2*r+1],s);
Ig3 =  imfilter(Ig2,GaussianFilter_3,'conv');

% Ic1 = GuidanceFilter1(I);
%  Ig1 = imnlmfilt(I,'DegreeOfSmoothing',1);
% Ic2 = GuidanceFilter1(Ic1);
%  Ig2 = imnlmfilt(Ig1,'DegreeOfSmoothing',1);
% Ic3 = GuidanceFilter1(Ic2);
%  Ig3 = imnlmfilt(Ig2,'DegreeOfSmoothing',1);

d10 = I-Ic1;
d11 = Ic1-Ig1;
d20 = Ig1-Ic2;
d21 = Ic2-Ig2;
d30 = Ig2-Ic3;
d31 = Ic3-Ig3;

d_fs{1} = d10;
d_fs{2} = d20;
d_fs{3} = d30;
d_cs{1} = d11;
d_cs{2} = d21;
d_cs{3} = d31;
B = Ig3;

end
