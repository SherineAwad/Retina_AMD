#! /usr/bin/env python
import sys
import argparse
import math


def filterAvg(Expfile): 
    for line in open(Expfile):
        if "RNA.RPE" in line: 
             continue
        records = (line.strip()).split(",")
        if (abs(float(records[1])) > 1) :  
           print (records[0].strip('"')) 
    return 

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('Expfile')
    args = parser.parse_args()
    Expfile = args.Expfile  
    filterAvg(Expfile) 
    
if __name__ == '__main__':
    main()

   

