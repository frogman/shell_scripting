#!/usr/bin/env python
import sys
import re
import os
import csv

#read every folder
r = [name for name in (os.path.join(".", each) for each in os.listdir(".")) if os.path.isdir(name)]

#open and write csv from the r variable
out = open('out.csv', 'w')
for row in r:
    for column in row:
        out.write('%s' % column)
    out.write('\n')
out.close()
