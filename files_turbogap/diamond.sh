#!/bin/bash
# make diamond with nx ny nz unit cells and lattice constant a for element El

echo "Making $5 diamond cell with $1 $2 $3 unit cells and lattice constant $4"
awk -v nx="$1" -v ny="$2" -v nz="$3" -v a="$4" -v El="$5" 'BEGIN{
la=a; nat=0;
x=nx*la;y=ny*la;z=nz*la;
natoms=nx*ny*nz*8;
printf "%s\n",natoms;
printf "Lattice=\"%1.5f 0.0 0.0 0.0 %1.5f 0.0 0.0 0.0 %1.5f\" Origin=\"0 0 0\" Properties=species:S:1:pos:R:3 pbc=\"T T T\"\n", x, y, z;
for (n=0; n<nx; n++){
for (m=0; m<ny; m++){
for (l=0; l<nz; l++){ #add the 4 atoms for each cell

#corner atom
nat+=1;
printf "%-2s %1.5f %1.5f %1.5f\n", El, n*la, m*la, l*la;

#face-centered atoms
nat+=1;
printf "%-2s %1.5f %1.5f %1.5f\n", El, n*la, (m*la+(la/2)), (l*la+(la/2));
nat+=1;
printf "%-2s %1.5f %1.5f %1.5f\n", El, (n*la+(la/2)), m*la, (l*la+(la/2));
nat+=1;
printf "%-2s %1.5f %1.5f %1.5f\n", El, (n*la+(la/2)), (m*la+(la/2)), l*la;

# 1/4 displaced atoms (1st row, 1/4 in z direction)
nat+=1;
printf "%-2s %1.5f %1.5f %1.5f\n", El, (n*la+(la/4)),   (m*la+(la/4)), (l*la+(la/4));
nat+=1;
printf "%-2s %1.5f %1.5f %1.5f\n", El, (n*la+(3*la/4)), (m*la+(3*la/4)), (l*la+(la/4));

# 1/4 displaced atoms (2nd row, 3/4 in z direction)
nat+=1;
printf "%-2s %1.5f %1.5f %1.5f\n", El, (n*la+(3*la/4)), (m*la+(la/4)), (l*la+(3*la/4));
nat+=1;
printf "%-2s %1.5f %1.5f %1.5f\n", El, (n*la+(la/4)),   (m*la+(3*la/4)), (l*la+(3*la/4));
}
}
}
}' > $5_$1_$2_$3_diamond.xyz
