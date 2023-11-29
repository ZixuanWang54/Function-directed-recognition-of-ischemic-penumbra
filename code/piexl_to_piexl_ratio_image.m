%input reactant and product ion matrix
Reac=[]
Prod=[]
%pixel to pixel ratio image
r=Prod./Reac
r2=interp2(r)
r3=interp2(r2)
r4=interp2(r3)
r5=interp2(r4)
imagesc(r5)


