clc;
clear all;
io=imread("lena.tif");
Noise_Image=imnoise(io,'salt & pepper',0.8);
Denoised_Image=ACmF(Noise_Image);
psnr_results=psnr(io,Denoised_Image);
ssim_results=ssim(io,Denoised_Image);
