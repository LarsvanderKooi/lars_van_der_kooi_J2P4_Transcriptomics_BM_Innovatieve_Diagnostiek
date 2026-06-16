setwd("C:/Users/larsv/Desktop/Transcriptomics project/data")
getwd()


#packages laden
library(Rsubread)
library(Rsamtools)
library(DESeq2)
library(KEGGREST)
library(EnhancedVolcano)
library(pathview)
library(goseq)
library(org.Hs.eg.db)
library(AnnotationDbi)
library(clusterProfiler)

buildindex(
  basename = 'ref_Human',
  reference = 'referentie genoom/ncbi_dataset/data/GCF_000001405.40/GCF_000001405.40_GRCh38.p14_genomic.fna',
  memory = 4000,
  indexSplit = TRUE)

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