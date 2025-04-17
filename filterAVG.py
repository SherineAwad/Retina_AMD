#! /usr/bin/env python
import sys
import argparse
import math


def filterAvg(Expfile,idx): 
    for line in open(Expfile):
        if "RNA.RPE" in line: 
             continue
        records = (line.strip()).split(",")
        if (abs(float(records[idx])) > 1) :  
           print (records[0].strip('"')) 
    return 

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('Expfile')
    parser.add_argument('cell_idx')
    args = parser.parse_args()
    Expfile = args.Expfile  
    idx = int(args.cell_idx)
    filterAvg(Expfile, idx) 
    
if __name__ == '__main__':
    main()

   

