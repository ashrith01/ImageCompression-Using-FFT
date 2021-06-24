clc;close all;clear all;
%load image
disp('loading full image...')
A=imread('dog','jpeg');
figure(1)
imshow(A)

%comput fft of image
disp('doing fft analysis')
Ahat=fft2(A);
F=log(abs(fftshift(Ahat)+1));
F=mat2gray(F);
figure(2)
imshow(F,[]);

[nx,ny]=size(A);
figure(3),subplot(3,3,1),imshow(A),title('original image')

%zero out samll coefficients and inverse transform
count_pic=2;
for threshold= 0.1*[0.001 0.005 0.01 0.008 0.009]*max(abs(Ahat(:)))
    ind = abs (Ahat)>threshold; 
    AhatFilt = Ahat.*ind; 
    count = nx*ny - sum(ind(:)); 
    percent = 100-count/(nx*ny)*100; 
    Afilt = ifft2 (AhatFilt); 
    figure (3), subplot (3,3,count_pic)
    imshow (uint8(Afilt));
    count_pic = count_pic + 1;
    drawnow 
    title ([num2str(percent) '% of my fft basis'])
end