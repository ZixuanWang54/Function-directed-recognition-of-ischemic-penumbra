% batch reading *.cdf file and save into a cell named peaklist
% change the file_prefix_name and file_numbers to the actual name and file numbers
peaklist=batchcdfread('file_prefix_name',n)
% input cmz from function directed m/z values
% using cmz vector to construct the biocube which is composed
% of m/z value in the first column and its correpsonding 2D image data in the
% second column.
mass_tolerance=0.005;
datacube=batchmassimage(peaklist,cmz,mass_tolerance);
for i=1:length(cmz)
    datacube{i,2}=selectimagechanel(datacube{i,2},1);
end
clear i
clc
%extract the image of typical high-abundance metabolite ion,choline m/z 303.2327, 
AA=massimage(peaklist,303.2327,mass_tolerance);
AA=selectimagechanel(AA,1);
% manually select the whole-tissue or interestd region named as roi_bio
imagesc(AA);
roi_bio=roipoly;
% manually select the whole-body section region named as roi_bio
r=size(datacube{1,2},1);
 c=size(datacube{1,2},2);
 pixel_No=[1:r*c]';
 row_index=[];
 column_index=[];
 for i=1:r
      row_index=[row_index;repmat(i,c,1)];
      column_index=[column_index;[1:c]'];
 end
 pix_indx=[pixel_No,row_index,column_index];
 clear row_index column_index pixel_No i r c
% transfer from 3D biocube into 2D biomatrix
for i=1:length(datacube)
    temp=datacube{i,2}.*roi_bio;
    temp=temp';
    datamat(:,i)=temp(:);
end
key=roi_bio';
biopix_indx=pix_indx(find(key(:)==1),:);
biomat=datamat(find(key(:)==1),:);
clear i temp key
clc
% validate if the dimension reduction was correct
imagesc(indximg(biomat(:,1),biopix_indx(:,2),biopix_indx(:,3)));
% Unsupervised pixel clulstering
% data standardization
biomat_std=zscore(biomat);
% t-SNE dimension reduction from 50 variables into 3 features
tsne=tsne1(biomat_std,[],3,3,50);
%The class label was defined as No.1-10 
%The pixels within sample region was clustered using kmeans clustering
label=kmeans(tsne,3);
%label=kmeans(tsne,3,'distance','correlation');
%display the clustering results
%label=kmeans(tsne,3,'distance','hamming');
scatter3(tsne(:,1),tsne(:,2),tsne(:,3),20,label,'fill');
xlabel('tSNE1');ylabel('tSNE2');zlabel('tSNE3');
figure(2)
%re-evaluate the correctness of clustering by image visualization
label_image=indximg(label,biopix_indx(:,2),biopix_indx(:,3));
imagesc(label_image);
colormap(jet(11));