#! /usr/bin/env python
import sys
import argparse
import math


def readFile(infile): 
    mygenes = [] 
    for line in open(infile):
        mygenes.append(line.strip('"'))
    return mygenes

def overlapGenes(RPE, Genes):
    for gene in RPE: 
        if gene in Genes: 
            print(gene.strip())

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('Expfile')
    parser.add_argument('Genesfile')
    args = parser.parse_args()
    Expfile = args.Expfile  
    Genesfile =args.Genesfile
    RPE = readFile(Expfile) 
    Genes  = readFile(Genesfile) 
    overlapGenes(RPE, Genes)
if __name__ == '__main__':
    main()

   

