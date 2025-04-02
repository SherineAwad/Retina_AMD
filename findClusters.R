# Load Seurat library
library(Seurat)

# Load your annotated Seurat object
RPE_annotated <- readRDS("RPE_annotated.rds")

# Identify markers for cluster 12 compared to the rest
cluster_12_markers <- FindMarkers(RPE_annotated, ident.1 = 12, ident.2 = NULL, test.use = "wilcox")

# View the top 10 marker genes
head(cluster_12_markers, 10)

top_genes <- head(rownames(cluster_12_markers), 10)

figure_name <- ""
figure_name <- paste("Cluster12Markers.pdf", sep="")
pdf(file =figure_name, width =12)
FeaturePlot(RPE_annotated, features = top_genes, cols = c("lightgrey", "blue"), ncol = 5)
dev.off()


