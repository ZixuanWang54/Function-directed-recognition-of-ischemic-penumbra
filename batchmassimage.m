function [datacube] = batchmassimage(peaklist,cmz,ppm_value)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
iter=0;
 for m=1:length(cmz)
   target=cmz(m,1);
   datacube{m,1}=target;
   datacube{m,2}=massimage(peaklist,target,ppm_value);
   target=[];
   iter=iter+1
 end
 clear target m iter
 clc
end

