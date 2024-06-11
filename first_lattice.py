from ase.io import write
from ase import Atoms
import numpy as np

a = 3.5
cell = [a, a, a]
positions = [[0, 0, 0],
             [a/4, a/4, a/4],
             [0, a/2, a/2],
             [a/4, 3*a/4, 3*a/4],
             [a/2, 0, a/2],
             [3*a/4, a/4, 3*a/4],
             [a/2, a/2, 0],
             [3*a/4, 3*a/4, a/4]]

atoms = Atoms("C8", positions = positions, cell = cell, pbc=True)
# If you want a bigger or smaller system, adjust these numbers below
#atoms *= (3,3,3)

# Randomize the velocities at the beginning
vel = 0.01 * (np.random.sample([len(atoms),3])-0.5)
atoms.set_array("vel", vel)

write("diamond.xyz", atoms)

### 
# to inspect the created structure using ASE GUI:
#  ase gui diamond.xyz

## Now visualize using OVITO
#
#
#