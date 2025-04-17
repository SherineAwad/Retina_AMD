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
markers <- args[2] 
#Run on merged 
myRDS <- paste(mysample, "_annotated.rds", sep="")
myRDS

myObject <- readRDS(myRDS)

DefaultAssay(myObject) <- "RNA"

colnames(myObject@meta.data)



figure_name <- ""
figure_name <- paste(mysample, "_UMAP.pdf", sep="")
pdf(file =figure_name, width =12)
DimPlot(myObject, reduction = "umap", group.by = "orig.ident",  repel = TRUE) + ggtitle("UMAP")
DimPlot(myObject, reduction = "umap", label=TRUE, repel = TRUE) + ggtitle("UMAP")
dev.off()

gene_list <- rownames(myObject)
file_path <- paste(markers, ".txt", sep="")
fname1 <-  paste(markers, "_featuresplot.pdf", sep="")
fname2 <- paste0(markers, "_dotplot.pdf")
fname3 <- paste0(markers, "_heatmap.pdf")

markers <- readLines(file_path)
#Ignore featureplot for now 
if (FALSE)
{
figure_name <- paste(mysample, fname1, sep="")
figure_name 
file_path 
pdf(file =figure_name)

for (gene in markers) {
  if (gene %in% rownames(myObject)) {
    print(
      FeaturePlot(myObject,
                  features = gene,
                  order = TRUE,
                  reduction = "umap",
                  cols = c("lightgrey", "red"),
                  pt.size = 0.1) +
        ggtitle(gene)
    )
  } else {
    message(paste("Skipping", gene, "- not found in dataset"))
  }
}
dev.off()
}

myObject$cell_type <- as.character(Idents(myObject))
head(myObject@meta.data[, c("cell_type")])

figure_name <- paste0(mysample, fname2)
pdf(file = figure_name, width = 15)

valid_genes <- markers[markers %in% rownames(myObject)]
DotPlot(myObject,
              features = valid_genes,
              col.min = -100,
              col.max = 100,
              dot.scale = 12)

dev.off()
