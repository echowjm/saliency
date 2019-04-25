% The demo for Cluster-based Saliency Detection in single image

clc;close all;clear;

addpath('./COS_code');

para.img_path='F:\�о���\����\picaddbox/';
para.result_path = './img_output/';
para.img_name = '1_labeled.png';

%--- cluster number -------
para.Bin_num_single=6;
%---- scaling the image ---
para.Scale=300;

data.image{1}=imread([para.img_path para.img_name]);
[orgH, orgW, channel]=size(data.image{1});

% single sliency detection
single_map = Single_saliency_main( data, 1, para.Scale, para.Bin_num_single);

Saliency_Map_single=imresize(Gauss_normal(single_map), [orgH, orgW]);
imwrite(data.image{1},[para.result_path  para.img_name(1:end-4) '_org.png'],'png');
imwrite(Saliency_Map_single, [para.result_path  para.img_name(1:end-4) '_single.png'],'png');

figure,subplot(1,2,1), imshow(data.image{1}),title('Input images');
subplot(1,2,2),imshow(Saliency_Map_single),title('Single Saliency');


