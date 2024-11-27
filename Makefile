REF = /nfs/turbo/umms-thahoang/sherine/REFERENCES/ResourceBundle/Homo_sapiens_assembly38.fasta
GTF =/nfs/turbo/umms-thahoang/sherine/REFERENCES/Homo_sapiens/UCSC/hg38/Annotation/Genes/genes.gtf
SNPs = /nfs/turbo/umms-thahoang/sherine/REFERENCES/ResourceBundle/Homo_sapiens_assembly38.dbsnp138.vcf
INDELs = /nfs/turbo/umms-thahoang/sherine/REFERENCES/ResourceBundle/Homo_sapiens_assembly38.known_indels.vcf.gz
FASTQs =/nfs/turbo/umms-thahoang/sherine/RPE/FASTQs
OUTPUT =/nfs/turbo/umms-thahoang/sherine/RPE/
PICARD = /nfs/turbo/umms-thahoang/sherine/tools/picard.jar 



RPE_AvgExp_allAMD_genes.txt:
	grep 'RPE' RPE_DGE.csv > RPEonlyDGE.csv
	python filterDGE.py RPEonlyDGE.csv > RPE_DGE_filtered_genes.txt
	python filterAVG.py RPE_AvgExp.csv > RPE_AvgExp_filterd_genes.txt
	python overlap.py RPE_DGE_filtered_genes.txt allDryAMDgenes.txt > RPE_DGE_allAMD_genes.txt
	python overlap.py RPE_AvgExp_filterd_genes.txt allDryAMDgenes.txt > RPE_AvgExp_allAMD_genes.txt
