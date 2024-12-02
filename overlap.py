#! /usr/bin/env python
import sys
import argparse
import math


def readFile(infile): 
    mygenes = [] 
    for line in open(infile):
        mygenes.append(line.strip('"'))
    return mygenes

def overlapGenes(Exp, Genes):
    for gene in Exp:
        if gene in Genes: 
            print(gene.strip('\n'))

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('Expfile')
    parser.add_argument('Genesfile')
    args = parser.parse_args()
    Expfile = args.Expfile  
    Genesfile =args.Genesfile
    Exp = readFile(Expfile) 
    Genes  = readFile(Genesfile)
    overlapGenes(Exp, Genes)
if __name__ == '__main__':
    main()
