#       ase build -x diamond Si
#       ase convert Si.json database.db
#inspect database
#       ase db database.db
from ase.db import connect

#db = connect('database.db')s
#for row in db.select():
#    atoms = row.toatoms()
 #   print(atoms)

db = connect('database.db')
row = db.select(id=1)[0]
dir(row)

#gui database.db