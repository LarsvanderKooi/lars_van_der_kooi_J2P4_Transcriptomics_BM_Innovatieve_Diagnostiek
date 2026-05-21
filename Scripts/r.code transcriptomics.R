setwd("C:/Users/larsv/Desktop/Transcriptomics project/data")
getwd()

#packages laden
library(Rsubread)
library(Rsamtools)

#buildindex maken
buildindex(
  basename = 'ref_Human',
  reference = 'referentie genoom/ncbi_dataset/data/GCF_000001405.40/GCF_000001405.40_GRCh38.p14_genomic.fna',
  memory = 4000,
  indexSplit = TRUE)

#pair-end mapping
align(
  index = "ref_Human",
  readfile1 = "Data_RA_raw/Normaal_Female_19_1_subset40k.fastq",
  readfile2 = "Data_RA_raw/Normaal_Female_19_2_subset40k.fastq",
  output_file = "Norm1.BAM"
)
align(
  index = "ref_Human",
  readfile1 = "Data_RA_raw/Normaal_Female_20_1_subset40k.fastq",
  readfile2 = "Data_RA_raw/Normaal_Female_20_2_subset40k.fastq",
  output_file = "Norm2.BAM"
)
align(
  index = "ref_Human",
  readfile1 = "Data_RA_raw/Normaal_Female_28_1_subset40k.fastq",
  readfile2 = "Data_RA_raw/Normaal_Female_28_2_subset40k.fastq",
  output_file = "Norm3.BAM"
)
align(
  index = "ref_Human",
  readfile1 = "Data_RA_raw/Normaal_Female_31_1_subset40k.fastq",
  readfile2 = "Data_RA_raw/Normaal_Female_31_2_subset40k.fastq",
  output_file = "Norm4.BAM"
)
align(
  index = "ref_Human",
  readfile1 = "Data_RA_raw/ziek_Female_79_1_subset40k.fastq",
  readfile2 = "Data_RA_raw/ziek_Female_79_2_subset40k.fastq",
  output_file = "Ziek1.BAM"
)
align(
  index = "ref_Human",
  readfile1 = "Data_RA_raw/ziek_Female_80_1_subset40k.fastq",
  readfile2 = "Data_RA_raw/ziek_Female_80_2_subset40k.fastq",
  output_file = "Ziek2.BAM"
)
align(
  index = "ref_Human",
  readfile1 = "Data_RA_raw/ziek_Female_86_1_subset40k.fastq",
  readfile2 = "Data_RA_raw/ziek_Female_86_2_subset40k.fastq",
  output_file = "Ziek3.BAM"
)
align(
    index = "ref_Human",
    readfile1 = "Data_RA_raw/ziek_Female_88_1_subset40k.fastq",
    readfile2 = "Data_RA_raw/ziek_Female_88_2_subset40k.fastq",
    output_file = "Ziek4.BAM"
)
align(
  index = "ref_Human",
  readfile1 = "Data_RA_raw/ziek_Female_19_1_subset40k.fastq",
  readfile2 = "Data_RA_raw/ziek_Female_19_2_subset40k.fastq",
  output_file = "Ziek1.BAM"
)
  
  samples <- c(
    "Norm1",
    "Norm2",
    "Norm3",
    "Norm4",
    "Ziek1",
    "Ziek2",
    "Ziek3",
    "Ziek4"
  )
  
  lapply(samples, function(s) {sortBam(file = paste0(s, '.BAM'), destination = paste0(s, '.sorted'))
  })
  
  lapply(samples, function(s) {indexBam(file = paste0(s, '.sorted.bam'))
  })
  
  count_matrix_Project <- featureCounts(
    files = c("Norm1.BAM","Norm2.BAM","Norm3.BAM","Norm4.BAM","Ziek1.BAM","Ziek2.BAM","Ziek3.BAM","Ziek4.BAM"),
    annot.ext = "GTF/ncbi_dataset/data/GCF_000001405.40/genomic.gtf",
    isPairedEnd = TRUE,
    isGTFAnnotationFile = TRUE,
    GTF.featureType = "gene", 
    GTF.attrType = "gene_id",
    useMetaFeatures = TRUE
  )
  
  str(count_matrix_Project)
  
  counts_Project <- count_matrix_Project$counts
  head(counts_Project)
  
  colnames(counts_Project) <- c("Norm1", "Norm2", "Norm3", "Norm4", "Ziek1", "Ziek2", "Ziek3", "Ziek4")
  head(counts_Project)
  
  write.csv(counts_Project, "Project_countmatrix.csv")