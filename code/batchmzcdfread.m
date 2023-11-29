function [peaklist] = batchmzcdfread(prefix,rows )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
peaklist={};
for i=1:rows
    temp=mzcdfread([prefix,num2str(i),'.cdf']);
    [peaklist{i,1},~]=mzcdf2peaks(temp);
    temp={};
end
clear temp i
end

