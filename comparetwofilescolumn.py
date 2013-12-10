#!/usr/bin/python
#Zeljko Milionovic
#http://itstuffallaround.blogspot.com/
#This script takes row values from one .csv file and compares the equal values for every row in second .csv file
#If match is found it will writte all the results with not found and found in a third file

import csv

f1 = file('disk.csv', 'r')
f2 = file('mysql.csv', 'r')
f3 = file('results.csv', 'w')

c1 = csv.reader(f1)
c2 = csv.reader(f2)
c3 = csv.writer(f3)

masterlist = [row for row in c2]

for hosts_row in c1:
    row = 1
    found = False
    for master_row in masterlist:
        results_row = hosts_row
        if hosts_row == master_row:
            results_row.append('FOUND')
            found = True
            break
        row = row + 1
    if not found:
           results_row.append('NOT FOUND')
    c3.writerow(results_row)

f1.close()
f2.close()
f3.close()
