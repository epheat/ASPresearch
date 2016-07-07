#parenthesestrim.py
#gets rid of any expression in parentheses, line by line, in the text file specified by the first command line argument.

import sys
import re

in_file = open(sys.argv[1],'r')
out_file = open(sys.argv[2],'w')

for line in in_file:
    #regex?
    if (len(re.findall("moves",line)) > 0):
        out_file.write(line)
        continue
    new = re.findall("\d*\.\d*",line)
    if (len(new) > 0):
        line = new[0]
    out_file.write(line + "\n")

in_file.close()
out_file.close()
