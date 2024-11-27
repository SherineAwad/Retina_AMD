library(Signac)
library(Seurat)
library(GenomeInfoDb)
library(EnsDb.Hsapiens.v86)
library(BSgenome.Hsapiens.UCSC.hg38)
library(future)
library(ggplot2)
library(patchwork)
library(Matrix)
library(dplyr)
set.seed(1234)

args <- commandArgs(trailingOnly = TRUE)
mysample <- args[1]

#Run on merged 
myRDS <- paste(mysample, ".rds", sep="")
myRDS

myObject <- readRDS(myRDS)

DefaultAssay(myObject) <- "RNA"


all.genes <- rownames(myObject)
myObject <- NormalizeData(myObject)
myObject <- FindVariableFeatures(myObject)
myObject <- ScaleData(myObject, features = all.genes)
myObject <- RunPCA(myObject)
myObject <- FindNeighbors(myObject, dims = 1:8)
myObject <- FindClusters(myObject, resolution = 2.0)
myObject <- RunUMAP( myObject, dims = 1:8)

myObject[["RNA"]] <- JoinLayers(myObject[["RNA"]])

myRDS <- paste(mysample, "_analysed.rds", sep="")
saveRDS(myObject, file = myRDS)

