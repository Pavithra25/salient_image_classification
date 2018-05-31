clc;
clear all;
close all;
x = imread('cameraman.tif');
[r c] = size(x);
Dx = [-1 0 1];
Dy = [1;0;-1];
x=double(x);
u=zeros(r,c);
for j=2:3:c
    for i=1:r
        u(i,j-1:j+1) = x(i,j-1:j+1) *Dy;
    end
end
z = zeros(r,c);
for i=2:3:c
    for j=1:r
        z(i-1:i+1,j) = Dx*x(i-1:i+1,j);
    end
end
imshow(z);
figure;
imshow(u)
g = sqrt(u.^2+z.^2);
angle=atan2(u,z);
alpha = angle.* 180/pi;
for i = 1:r
    for j= 1:c
        if alpha(i,j)>=0
            nalpha(i,j) =  alpha(i,j);
        else
            nalpha(i,j) = alpha(i,j)+360;
        end
    end
end
for i = 1:r
    for j= 1:c
        if nalpha(i,j) >=0 && nalpha(i,j)<=40
            colorimg(i,j,1) =255;
            colorimg(i,j,2) =0;
            colorimg(i,j,3) =0;
        else if nalpha(i,j)>40 && nalpha(i,j)<=80
                colorimg(i,j,1) =255;
            colorimg(i,j,2) =255;
            colorimg(i,j,3) =0;
             else if nalpha(i,j)>80 && nalpha(i,j)<=120
                colorimg(i,j,1) =0;
            colorimg(i,j,2) =255;
            colorimg(i,j,3) =0;
             else if nalpha(i,j)>120 && nalpha(i,j)<=160
                colorimg(i,j,1) =0;
            colorimg(i,j,2) =255;
            colorimg(i,j,3) =0;
             else if nalpha(i,j)>160&& nalpha(i,j)<=200
                colorimg(i,j,1) =0;
            colorimg(i,j,2) =255;
            colorimg(i,j,3) =128;
             else if nalpha(i,j)>200 && nalpha(i,j)<=240
                colorimg(i,j,1) =0;
            colorimg(i,j,2) =255;
            colorimg(i,j,3) =255;
             else if nalpha(i,j)>240 && nalpha(i,j)<=280
                colorimg(i,j,1) =0;
            colorimg(i,j,2) =255;
            colorimg(i,j,3) =255;
                 else if  nalpha(i,j)>280 && nalpha(i,j)<=320
                colorimg(i,j,1) =128;
            colorimg(i,j,2) =0;
            colorimg(i,j,3) =255;
             else  nalpha(i,j)>320 && nalpha(i,j)<=360
                colorimg(i,j,1) =255;
            colorimg(i,j,2) =0;
            colorimg(i,j,3) =255;
                     end
                 end
                 end
                 end
                 end
                 end
            end
        end
    end
end
figure
imshow(colorimg);
            
