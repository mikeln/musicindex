#!/usr/bin/python

import sys
from csv import reader

TITLE = 0
START = 1
END = 2

with open(sys.argv[1], 'r') as csv:
    csv_reader = reader(csv)
    lastrow = None
    for row in csv_reader:
        if lastrow != None:
            lastrow[END] = str(int(row[START])-1)
            if ',' in lastrow[TITLE]:
                lastrow[TITLE] = '"' + lastrow[TITLE] +'"'
            print ",".join(lastrow)
        lastrow = row
    print ",".join(lastrow)
