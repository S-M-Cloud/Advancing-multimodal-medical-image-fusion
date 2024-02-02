function result = GuidanceFilter1(Image_input1)


[Gmag,Gdir] = imgradient(Image_input1,'central');

result=imguidedfilter(Image_input1,Image_input1-Gmag);


end



