#werkdirectory instellen
setwd("C:/Users/larsv/Desktop/Transcriptomics project/data")
# controle huidige werkdirectory
getwd()


#packages inladen, versies en bron zijn te vinden in het mapje "packages"
library(Rsubread)         # read alignment en featureCounts
library(Rsamtools)        # werken met BAM/SAM bestanden
library(DESeq2)           # differentiële expressie analyse
library(KEGGREST)         # toegang tot KEGG database
library(EnhancedVolcano)  # visualisatie van DE resultaten
library(pathview)         # pathway visualisatie
library(goseq)            # GO enrichment analyse
library(org.Hs.eg.db)     # humane gen annotatie database
library(AnnotationDbi)    # annotatie tools
library(clusterProfiler)  # enrichment analyses

#referentiegenoom index bouwen voor alignen
buildindex(
  basename = 'ref_Human',
  reference = 'referentie genoom/ncbi_dataset/data/GCF_000001405.40/GCF_000001405.40_GRCh38.p14_genomic.fna',
  memory = 4000,
  indexSplit = TRUE)

#reads alignen (gezonde controle RNA-seq FASTQ files -> BAM files)
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

#reads alignen (RA-patiënten RNA-seq FASTQ files -> BAM files)
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