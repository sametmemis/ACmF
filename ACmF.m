%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Citation:
% S. Enginoğlu, U. Erkan, and S. Memiş, 2020. Adaptive Cesáro Mean Filter  
% for Salt-and-Pepper Noise Removal, El-Cezeri Journal of Science and 
% Engineering, 7(1), 304-314.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abbreviation of Journal Title: El-Cezeri J. Sci. Eng.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% https://doi.org/10.31202/ecjse.646359
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% https://www.researchgate.net/profile/Serdar_Enginoglu2
% https://www.researchgate.net/profile/Ugur_Erkan
% https://www.researchgate.net/profile/Samet_Memis2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Demo: 
% clc;
% clear all;
% io=imread("lena.tif");
% Noise_Image=imnoise(io,'salt & pepper',0.8);
% Denoised_Image=ACmF(Noise_Image);
% psnr_results=psnr(io,Denoised_Image);
% ssim_results=ssim(io,Denoised_Image);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function X=ACmF(A)
A=double(A);
 for p=5:-1:1  
  pA=padarray(A,[p p],'symmetric');
  pB=(pA~=0 & pA~=255);
  [m,n]=size(pB);
  for i=1+p:m-p
    for j=1+p:n-p       
       if (pB(i,j)==0)          
            for k=1:p
                if (isequal(pB(i-k:i+k,j-k:j+k),zeros(2*k+1,2*k+1))~=1)             
                     R1=pA(i-k:i+k,j-k:j+k);
                     R2=R1(R1>0 & R1<255);
                     A(i-p,j-p)=mean(R2);
                     break;
                end
            end
       end
    end 
  end   
 end
  X=uint8(A);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%