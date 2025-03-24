#! /usr/bin/env python
import sys
import argparse
import math


def filterDGE(dgefile): 
    for line in open(dgefile):
        if "p_val_adj" in line: 
             continue
        records = (line.strip()).split(",")
        if (float(records[5]) < 0.01) and (abs(float(records[2])) > 5) : 
                print (records[0].strip('"')) 
    return 

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('dgefile')
    args = parser.parse_args()
    dgefile = args.dgefile  
    filterDGE(dgefile) 
    
if __name__ == '__main__':
    main()

   

