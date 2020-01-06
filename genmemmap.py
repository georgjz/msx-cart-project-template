# This simple Python script generates the memory map for wlalink

import glob

objlist = glob.glob("obj/*.o")

fh = open("MemoryMap.cfg", "w")

fh.write("[objects]" + '\n')
for x in objlist:
    fh.write(x + '\n')

fh.close()