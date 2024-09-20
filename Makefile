RPE_AvgExp_AMD_genes.txt: 
	grep 'RPE' RPE_DGE.csv > RPEonlyDGE.csv 
	python filterDGE.py RPEonlyDGE.csv > RPE_DGE_filtered_genes.txt  
	python filterAVG.py RPE_AvgExp.csv > RPE_AvgExp_filterd_genes.txt 
	python overlap.py RPE_DGE_filtered_genes.txt AsianAMDgenes.txt > RPE_DGE_AMD_genes.txt 
	python overlap.py RPE_AvgExp_filterd_genes.txt AsianAMDgenes.txt > RPE_AvgExp_AMD_genes.txt 	
