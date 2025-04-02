REF = /nfs/turbo/umms-thahoang/sherine/REFERENCES/ResourceBundle/Homo_sapiens_assembly38.fasta
GTF =/nfs/turbo/umms-thahoang/sherine/REFERENCES/Homo_sapiens/UCSC/hg38/Annotation/Genes/genes.gtf
SNPs = /nfs/turbo/umms-thahoang/sherine/REFERENCES/ResourceBundle/Homo_sapiens_assembly38.dbsnp138.vcf
INDELs = /nfs/turbo/umms-thahoang/sherine/REFERENCES/ResourceBundle/Homo_sapiens_assembly38.known_indels.vcf.gz
FASTQs =/nfs/turbo/umms-thahoang/sherine/RPE/FASTQs
OUTPUT =/nfs/turbo/umms-thahoang/sherine/RPE/
PICARD = /nfs/turbo/umms-thahoang/sherine/tools/picard.jar 


RPE_AvgExp_dAMDGenesAF500_01.txt:
	grep 'RPE' RPE_DGE.csv > RPEonlyDGE.csv
	python filterDGE.py RPEonlyDGE.csv > RPE_DGE_filtered_genes.txt
	python filterAVG.py RPE_AvgExp.csv > RPE_AvgExp_filterd_gene.txt
	python overlap.py RPE_DGE_filtered_genes.txt dryAMDAF500_01.txt  > RPE_DGE_dAMDGenesAF500_01.txt
	python overlap.py RPE_AvgExp_filterd_gene.txt dryAMDAF500_01.txt  > RPE_AvgExp_dAMDGenesAF500_01.txt


RPE_AvgExp_dAMDGenesselected.txt:
	grep 'RPE' RPE_DGE.csv > RPEonlyDGE.csv
	python filterDGE.py RPEonlyDGE.csv > RPE_DGE_filtered_genes.txt
	python filterAVG.py RPE_AvgExp.csv > RPE_AvgExp_filterd_gene.txt
	python overlap.py RPE_DGE_filtered_genes.txt  dAMD_selected.txt > RPE_DGE_dAMDGenesselected.txt
	python overlap.py RPE_AvgExp_filterd_gene.txt dAMD_selected.txt  > RPE_AvgExp_dAMDGenesselected.txt
