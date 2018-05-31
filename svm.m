clc;
close all;
clear all;
ImgFlag = 1;%1,david,2,tiger2,3,sylvester,4,twinnings,5,cliffbar...
[ImgFileName,initstate] = initCt(ImgFlag);%initial tracker
%%
%Set path
pathName = strcat('.\data\',ImgFileName);
addpath(pathName,strcat(pathName,'\imgs'));
fpath = fullfile(strcat(pathName,'\imgs'),'*.png');
addpath(pathName);
img_dir = dir(fpath);
num = length(img_dir);% number of frames
x = initstate(1);% x axis at the Top left corner
y = initstate(2);
w = initstate(3);% width of the rectangle
h = initstate(4);% height of the rectangle
%%
%Graph based visual saliency map computation
img = imread(img_dir(1).name);
out_gbvs = gbvs(img);
img1 = out_gbvs.master_map_resized;
saliency_map = img1;
%%
%Adaptive Hystererisis Thresholding
x1 = adaptive_hys_thresh(saliency_map);
%%
%Calculation of bounding boxes
[num_of_objects, propied] = bb_box_calcu(x1);
bou_box = propied.BoundingBox
%%
%PCA Feature extraction
rectangle ('Position',bou_box,'EdgeColor','red')
org = imcrop(x1,bou_box);
[fea s g]= princomp(org);
Pattern Recognition and Machine learning Page 26
b_ground = imcrop(x1, [2 2 70 70]);
[fea1 s2 g2] = princomp(b_ground);
feature= mean(s);
feature2 = mean(s2);
new_feature = [ feature(1:70); feature2(1:70)];
group = [1 2];
svmstruct = svmtrain(new_feature,group);
n_fetr = [];
for i = 2:length(img_dir) - 450
img = imread(img_dir(i).name);
out_gbvs = gbvs(img);
img2 = out_gbvs.master_map_resized;
saliency_map = img2;
x2 = adaptive_hys_thresh(saliency_map);
[num_of_objects, propied1] = bb_box_calcu(x2);
bou_box1 = propied1.BoundingBox
org1 = imcrop(x1,bou_box1);
[fea s g]= princomp(org);
b_ground = imcrop(x1, [2 2 70 70]);
[fea1 s2 g2] = princomp(b_ground);
feature= mean(s);
feature2 = mean(s2);
new_feature = [ feature(1:70); feature2(1:70)];
n_fetr = [n_fetr; new_feature];
end
group1 = svmclassify(svmstruct, n_fetr);
[GNspecies,grpOrder] = confusionmat(group,group1);clc;
close all;
clear all;
ImgFlag = 1;%1,david,2,tiger2,3,sylvester,4,twinnings,5,cliffbar...
[ImgFileName,initstate] = initCt(ImgFlag);%initial tracker
%%
%Set path
pathName = strcat('.\data\',ImgFileName);
addpath(pathName,strcat(pathName,'\imgs'));
fpath = fullfile(strcat(pathName,'\imgs'),'*.png');
addpath(pathName);
img_dir = dir(fpath);
num = length(img_dir);% number of frames
x = initstate(1);% x axis at the Top left corner
y = initstate(2);
w = initstate(3);% width of the rectangle
h = initstate(4);% height of the rectangle
%%
%Graph based visual saliency map computation
img = imread(img_dir(1).name);
out_gbvs = gbvs(img);
img1 = out_gbvs.master_map_resized;
saliency_map = img1;
%%
%Adaptive Hystererisis Thresholding
x1 = adaptive_hys_thresh(saliency_map);
%%
%Calculation of bounding boxes
[num_of_objects, propied] = bb_box_calcu(x1);
bou_box = propied.BoundingBox
%%
%PCA Feature extraction
rectangle ('Position',bou_box,'EdgeColor','red')
org = imcrop(x1,bou_box);
[fea s g]= princomp(org);
Pattern Recognition and Machine learning Page 26
b_ground = imcrop(x1, [2 2 70 70]);
[fea1 s2 g2] = princomp(b_ground);
feature= mean(s);
feature2 = mean(s2);
new_feature = [ feature(1:70); feature2(1:70)];
group = [1 2];
svmstruct = svmtrain(new_feature,group);
n_fetr = [];
for i = 2:length(img_dir) - 450
img = imread(img_dir(i).name);
out_gbvs = gbvs(img);
img2 = out_gbvs.master_map_resized;
saliency_map = img2;
x2 = adaptive_hys_thresh(saliency_map);
[num_of_objects, propied1] = bb_box_calcu(x2);
bou_box1 = propied1.BoundingBox
org1 = imcrop(x1,bou_box1);
[fea s g]= princomp(org);
b_ground = imcrop(x1, [2 2 70 70]);
[fea1 s2 g2] = princomp(b_ground);
feature= mean(s);
feature2 = mean(s2);
new_feature = [ feature(1:70); feature2(1:70)];
n_fetr = [n_fetr; new_feature];
end
group1 = svmclassify(svmstruct, n_fetr);
[GNspecies,grpOrder] = confusionmat(group,group1);
