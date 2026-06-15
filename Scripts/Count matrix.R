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

# Volledig count_matrix inladen
count_matrix_RA <- read.table("count_matrix_RA.txt")
counts_Project <- as.matrix(count_matrix_RA)
head(counts_Project)

colnames(counts_Project) <- c("Norm1", "Norm2", "Norm3", "Norm4", "Ziek1", "Ziek2", "Ziek3", "Ziek4")
head(counts_Project)

write.csv(counts_Project, "Project_countmatrix.csv")