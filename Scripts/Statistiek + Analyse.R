counts_project <- read.csv("Project_countmatrix.csv", row.names = 1)
counts_project

treatment <- c("Normaal", "Normaal", "Normaal", "Normaal", "Ziek", "Ziek", "Ziek", "Ziek")
treatment_table_project <- data.frame(treatment)

rownames(treatment_table_project) <- c('Norm1', 'Norm2', 'Norm3', 'Norm4', 'Ziek1', 'Ziek2', "Ziek3", "Ziek4")
head(treatment_table_project)

#metadata opslaan voor GitHub
metadata <- data.frame(
  Sample = rownames(treatment_table_project),
  Treatment = treatment_table_project$treatment
)

write.csv(
  metadata,
  "metadata.csv",
  row.names = FALSE
)

dds_project <- DESeqDataSetFromMatrix(countData = counts_Project,
                                      colData = treatment_table_project,
                                      design = ~ treatment)
head(dds_project)

dds_project <- DESeq(dds_project)
resultaten <- results(dds_project)
head(resultaten)

write.table(resultaten, file = 'Resultaten_Project.csv', row.names = TRUE, col.names = TRUE)
head(write.table)

sum(resultaten$padj < 0.05 & resultaten$log2FoldChange > 1, na.rm = TRUE)
sum(resultaten$padj < 0.05 & resultaten$log2FoldChange < -1, na.rm = TRUE)

hoogste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = TRUE), ]
laagste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = FALSE), ]
laagste_p_waarde<- resultaten[order(resultaten$padj, decreasing = FALSE), ]

head(hoogste_fold_change)
head(laagste_fold_change)
head(laagste_p_waarde)

EnhancedVolcano(resultaten,
                lab = rownames(resultaten),
                x = 'log2FoldChange',
                y = 'padj')

dev.copy(png, 'VolcanoplotWC.png', 
         width = 8,
         height = 10,
         units = 'in',
         res = 500)
dev.off()

sig_genes <- resultaten[
  !is.na(resultaten$padj) &
    resultaten$padj < 0.05 &
    abs(resultaten$log2FoldChange) > 1,
]

nrow(sig_genes)

head(sig_genes)

gene.df <- bitr(
  rownames(sig_genes),
  fromType = "SYMBOL",
  toType = "ENTREZID",
  OrgDb = org.Hs.eg.db
)

gene.df <- na.omit(gene.df)

ego_BP <- enrichGO(
  gene = gene.df$ENTREZID,
  OrgDb = org.Hs.eg.db,
  keyType = "ENTREZID",
  ont = "BP",
  pAdjustMethod = "BH",
  pvalueCutoff = 0.05,
  qvalueCutoff = 0.05,
  readable = TRUE
)

# GO-resultaten opslaan
write.csv(
  as.data.frame(ego_BP),
  "GO_results.csv",
  row.names = FALSE
)

head(as.data.frame(ego_BP))
dim(as.data.frame(ego_BP))

barplot(ego_BP, showCategory = 10, font.size = 8, label_format = 40) +
  theme(
    axis.text.y = element_text(size = 8),
    plot.title = element_text(hjust = 0.5)
  )

fc.df <- data.frame(
  SYMBOL = rownames(resultaten),
  logFC = resultaten$log2FoldChange
)
head(fc.df)
dim(fc.df)


fc.entrez <- merge(
  gene.df,
  fc.df,
  by = "SYMBOL"
)

head(fc.entrez)
dim(fc.entrez)

gene.data <- fc.entrez$logFC
names(gene.data) <- fc.entrez$ENTREZID

head(gene.data)
length(gene.data)


pathview(
  gene.data = gene.data,
  pathway.id = "hsa05323",
  species = "hsa",
  gene.idtype = "entrez",
  limit = list(gene = 5)
)
