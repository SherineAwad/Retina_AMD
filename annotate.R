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

mysample = args[1]
myRDS <- paste(mysample, "_analysed.rds", sep="")

mysample
myRDS

myObject <-readRDS(myRDS) 

myObject <- RenameIdents(
   object = myObject,
   "11" = "RPE",
   "19" = "RPE", 
   "20" = "RPE",
   "21" = "RPE",
   "24" = "RPE",
   "28" = "RPE",

   "16" = "Fibroblast",
   "27" = "Fibroblast",

   "23" = "Melanocytes", 
   "10" = "Melanocytes",
   "18" = "Melanocytes", 
   
   "0" = "T-Cells", 
   "1"  = "T-Cells",
   "2"  = "T-Cells",
   "3"  = "T-Cells",
   "5"  = "T-Cells",
   "7"  = "T-Cells",
   "13" = "T-Cells",
   "14" = "T-Cells",
   "15" = "T-Cells",
   "26"  = "T-Cells",
   "32"  = "T-Cells",

   "29" = "Mast Cells",
   "30" = "Mast Cells", 

   "6" = "Vascular/Endothelial", 
   "9" = "Vascular/Endothelial",  
   "22" = "Vascular/Endothelial",  
   "31" = "Vascular/Endothelial",  
   "33" = "Vascular/Endothelial",   

   "8" = "Microglia", 
   "4"  = "Microglia",
   "17"  = "Microglia",
   "25"  = "Microglia",
    
   "12" = "Erythrocyte", 

   "15" = "Neutrophil", 
   "30" = "Neutrophil" )


myRDS <- paste(mysample, "_annotated.rds", sep="")
saveRDS(myObject, file = myRDS)

figure_name <- ""
figure_name <- paste(mysample, "_Annotated_UMAP.pdf", sep="")
pdf(file =figure_name, width =8, height=8)
DimPlot(myObject, reduction = "umap", group.by = "orig.ident",  repel = TRUE) + ggtitle("UMAP")
DimPlot(myObject, reduction = "umap", label=TRUE, repel = TRUE) + ggtitle("UMAP")
dev.off()


head(Idents(myObject))
myRDS <- paste(mysample, "_annotated.rds", sep="")
saveRDS(myObject, file = myRDS)



