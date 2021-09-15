clc;
clear;

a=imread('1.png');
[row,cols, p]=size(a);
str1='000001000';
str3='00000100';
str2='.jpg';
%frm = zeros(1,frame_cnt);
frame_cnt=98;
h=waitbar(0,'Please wait.....');
j=1;

for fr = 1:98
	Filename=strcat(str1,num2str(fr),str2);
	if fr >9
		Filename=strcat(str3,num2str(fr),str2);
	end
    img = imread(Filename);
    %img = frame2im(frm(fr));
    img = rgb2gray(img);
    img_1d(fr) = img(:);
    %j=j+1;
    filenme = strcat(num2str(fr),str2);
    imwrite(img,filenme);
    waitbar(fr/99,h);
end
close(h);

back_img = zeros(frame_cnt,row*cols);
%fr = 1;
for i = 1:frame_cnt
	temp_img = img_1d(i);
	back_img(i,:) = temp_img;
	%fr = fr+1
end

img1 = mode(back_img);
background = reshape(img1,[row cols]);
figure,imshow(background,[]);
title('Background Image');
imwrite(uint8(background),'background_img.jpg')
disp('Process completed');