REF = /nfs/turbo/umms-thahoang/sherine/REFERENCES/ResourceBundle/Homo_sapiens_assembly38.fasta
GTF =/nfs/turbo/umms-thahoang/sherine/REFERENCES/Homo_sapiens/UCSC/hg38/Annotation/Genes/genes.gtf
SNPs = /nfs/turbo/umms-thahoang/sherine/REFERENCES/ResourceBundle/Homo_sapiens_assembly38.dbsnp138.vcf
INDELs = /nfs/turbo/umms-thahoang/sherine/REFERENCES/ResourceBundle/Homo_sapiens_assembly38.known_indels.vcf.gz
FASTQs =/nfs/turbo/umms-thahoang/sherine/RPE/FASTQs
OUTPUT =/nfs/turbo/umms-thahoang/sherine/RPE/
PICARD = /nfs/turbo/umms-thahoang/sherine/tools/picard.jar 


Microglia_AvgExp_dAMDGenes.txt:
	grep 'RPE' RPE_DGE.csv > RPEonlyDGE.csv
	python filterDGE.py RPEonlyDGE.csv > RPE_DGE_filtered_genes.txt
	python filterAVG.py RPE_AvgExp.csv 1 > RPE_AvgExp_filterd_gene.txt
	python overlap.py RPE_DGE_filtered_genes.txt markers.txt  > RPE_DGE_dAMDGenes.txt
	python overlap.py RPE_AvgExp_filterd_gene.txt markers.txt  > RPE_AvgExp_dAMDGenes.txt

Tcells_AvgExp_dAMDGenes.txt: 
	python filterAVG.py RPE_AvgExp.csv 1 > RPE_AvgExp_filterd_gene.txt
	python overlap.py RPE_AvgExp_filterd_gene.txt markers.txt  > RPE_AvgExp_dAMDGenes.txt

	python filterAVG.py RPE_AvgExp.csv 7 > Microglia_AvgExp_filterd_gene.txt
	python overlap.py Microglia_AvgExp_filterd_gene.txt markers.txt > Microglia_AvgExp_dAMDGenes.txt 

	python filterAVG.py RPE_AvgExp.csv 4 > Tcells_AvgExp_filterd_gene.txt
	python overlap.py Tcells_AvgExp_filterd_gene.txt markers.txt > Tcells_AvgExp_dAMDGenes.txt
	cat Microglia_AvgExp_dAMDGenes.txt RPE_AvgExp_dAMDGenes.txt Tcells_AvgExp_dAMDGenes.txt | sort | uniq > topMarkers.txt 
RPE_AvgExp_dAMDGenesselected.txt:
	grep 'RPE' RPE_DGE.csv > RPEonlyDGE.csv
	python filterDGE.py RPEonlyDGE.csv > RPE_DGE_filtered_genes.txt
	python filterAVG.py RPE_AvgExp.csv > RPE_AvgExp_filterd_gene.txt
	python overlap.py RPE_DGE_filtered_genes.txt  dAMD_selected.txt > RPE_DGE_dAMDGenesselected.txt
	python overlap.py RPE_AvgExp_filterd_gene.txt dAMD_selected.txt  > RPE_AvgExp_dAMDGenesselected.txt
