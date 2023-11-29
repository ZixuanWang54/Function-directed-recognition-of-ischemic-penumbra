#Function-directed-recognition-of-ischemic-penumbra (latent lesions)

## Introduction
An unsupervised  method for recognizing latent lesions in mass spectrometry imaging data.
##Function-directed enrichment
#Data Preprocessing
The collected raw data from MSI was converted to .cdf files using Xcalibur software.
Use the script "function_directed_segmentation".
Input MSI data in .cdf files, each raw as a single file with name ending in consecutive numbers.
eg: "M-1","M-2","M-3"……“M-60”；
Reconstruct MSI images.
A peak intensity threshold (e.g., 5000) was used to cut oﬀ the noise signals. 
Data normalization was performed on the entire data matrix to further reduce the mass intensity variant in each mass pixel.
#Function Enrichment
Ions in the whole tissue region were selected as ROI with an m/z tolerance of 0.005 Da, ranked by the average intensity among the ROI pixels, and then exported as a “.txt” file for further functional analysis. 
The functional feature selection process could be performed with Mummichog V1.08. (https://shuzhao-li.github.io/mummichog.org), MetaboanalystR (https://github.com/xia-lab/MetaboAnalystR), or simply using the “Functional Analysis” module in Metaboanalyst (https://www.metaboanalyst.ca/)
The “.txt” file containing the negative-ion mode data was uploaded and matched to different adduct ion forms.
The modified mummichog algorithm computed significant pathways and the activity network related to the dysfunction based on the corresponding KEGG pathway library.
##Visual Interpretation.
#Run the script "function_directed_segmentation"
input function directed enrichment m/z as cmz vector；
mass_tolerance=0.005;
manually select ROIs.
#Output
segmentation image and scatter plots.

##References
Anal Chem. 2022 Oct 11;94(40):13927-13935. 
Anal Chem. 2019 Feb 19;91(4):2838-2846.




