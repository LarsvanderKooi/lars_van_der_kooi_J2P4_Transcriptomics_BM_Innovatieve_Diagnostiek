#sample namen
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

#BAM bestanden sorteren
lapply(samples, function(s) {sortBam(file = paste0(s, '.BAM'), destination = paste0(s, '.sorted'))
})

#index maken voor snelle toegang tot BAM files
lapply(samples, function(s) {indexBam(file = paste0(s, '.sorted.bam'))
})

#read counting per gen met featureCounts 
count_matrix_Project <- featureCounts(
  files = c("Norm1.BAM","Norm2.BAM","Norm3.BAM","Norm4.BAM","Ziek1.BAM","Ziek2.BAM","Ziek3.BAM","Ziek4.BAM"),
  annot.ext = "GTF/ncbi_dataset/data/GCF_000001405.40/genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE,
  GTF.featureType = "gene", 
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE
)

#count_matrix_project bekijken
str(count_matrix_Project)

#Volledig count_matrix inladen
count_matrix_RA <- read.table("count_matrix_RA.txt")
counts_Project <- as.matrix(count_matrix_RA)

#kolomnamen zetten = sample labels
colnames(counts_Project) <- c("Norm1", "Norm2", "Norm3", "Norm4", "Ziek1", "Ziek2", "Ziek3", "Ziek4")

#opslaan Project_countmatrix bestand 
write.csv(counts_Project, "Project_countmatrix.csv")