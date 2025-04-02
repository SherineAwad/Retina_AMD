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
myRDS <- paste(mysample, "_analysed.rds", sep="")
myRDS

myObject <- readRDS(myRDS)

DefaultAssay(myObject) <- "RNA"

figure_name <- ""
figure_name <- paste(mysample, "_UMAP.pdf", sep="")
pdf(file =figure_name, width =12)
DimPlot(myObject, reduction = "umap", group.by = "orig.ident",  repel = TRUE) + ggtitle("UMAP")
DimPlot(myObject, reduction = "umap", label=TRUE, repel = TRUE) + ggtitle("UMAP")
dev.off()

gene_list <- rownames(myObject)
markers0 <- c("RIMS2") 
#markers0 <- c("PAX6", "OTX2","LHX2","TPSAB1", "CMA1","CPA3" )
markers1  <- c("OPN1LW", "ARR3", "PDE6H", "HLA_DPB1", "HLA_DQB1", "HLA_DPA1","AREG") 
markers2  <- c("CDH19", "SCN7A", "CA2", "WIF1", "TF", "MYL9", "MYH11", "ACTA2", "HBA1") 
markers3  <- c("LYZ", "S100A9", "S100A8", "CD83", "CD37", "MS4A1", "IGHM", "IGKC", "DCT") 
markers4  <- c("FHIT", "RPE65", "TTR", "IFI27", "ACKR1", "VWF", "RHO", "GNGT1", "SAG", "GZMA")
markers5  <- c("MLANA", "TYRP1", "PMEL", "C1QC", "C1QB", "C1QA", "MGP", "PLA2G2A") 
markers6 <- c("PLP1", "HBB",  "TFPI2", "CCL5", "IGFBP5",  "NKG7", "DAPL1","HBA2", "TSPB2") 
markers7 <- c("LRAT", "PECAM1", "HBA-A1", "CSF2RB", "RELN", "KRT17", "DES", "TRDC", "C9791", "KIT") 
markers8 <- c("PMEL", "TYR", "TEK", "TIE1", "HBA-BS", "HBA-BT", "PTPRC", "C1QA", "C1QB", "PENK", "TNR", "S100A2", "KLF5", "WNT4", "RGS5", "IL17A", "CD2","TRDC") 

figure_name <- ""
figure_name <- paste(mysample, "markers.pdf", sep="-")
pdf(file =figure_name, width=20)
FeaturePlot(myObject , features =markers0, order=TRUE, reduction = "umap", cols = c("lightgrey", "red"), pt.size = 0.1)
#FeaturePlot(myObject , features =markers1, order=TRUE, reduction = "umap", cols = c("lightgrey", "red"), pt.size = 0.1)
#FeaturePlot(myObject , features =markers2, order=TRUE, reduction = "umap", cols = c("lightgrey", "red"), pt.size = 0.1)
#FeaturePlot(myObject , features =markers3, order=TRUE, reduction = "umap", cols = c("lightgrey", "red"), pt.size = 0.1)
#FeaturePlot(myObject , features =markers4, order=TRUE, reduction = "umap", cols = c("lightgrey", "red"), pt.size = 0.1)
#FeaturePlot(myObject , features =markers5, order=TRUE, reduction = "umap", cols = c("lightgrey", "red"), pt.size = 0.1)
#FeaturePlot(myObject , features =markers6, order=TRUE, reduction = "umap", cols = c("lightgrey", "red"), pt.size = 0.1)
#FeaturePlot(myObject , features =markers7, order=TRUE, reduction = "umap", cols = c("lightgrey", "red"), pt.size = 0.1)
#FeaturePlot(myObject , features =markers8, order=TRUE, reduction = "umap", cols = c("lightgrey", "red"), pt.size = 0.1)
dev.off()


