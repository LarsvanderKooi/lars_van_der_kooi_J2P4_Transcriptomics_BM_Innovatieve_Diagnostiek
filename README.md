# **Project Transcriptomics J2P4**

# **Inhoud & Structuur**
* **Data (Raw)/** - Rauwe data 
* **Data (processed)/** - Verwerkte data
* **Scripts/** - Gebruikte scripts
* **Resultaten/** - Grafieken en tabellen
* **Bronnen/** - Gebruikte bronnen
* **README.md/** het document om de tekst hier te genereren
* **assets/** - overige documenten voor de opmaak van deze pagina

# **Introductie**
Reumatoïde artritis is een chronische auto-immuunziekte waarbij langdurige ontsteking van de gewrichten aanwezig zijn bij patiënten. Deze ontsteking leidt tot pijn, zwelling en beschadiging van kraakbeen en bot. Reumatoïde artritis ontstaat door een verstoring van het immuunsysteem, waarbij zowel aangeboren als adaptieve immuunreacties zijn betrokken. T-cellen, B-cellen en macrofagen, spelen een belangrijke rol bij het in stand houden van de ontstekingsreactie. (McInnes & Schett, 2007)

Door de ontwikkeling van RNA-sequencing (RNA-seq) is het mogelijk om veranderingen in genexpressie op een grotere schaal te onderzoeken. RNA-seq maakt het mogelijk om duizenden genen tegelijkertijd te analyseren en verschillen tussen gezonde en zieke individuen te vergelijken. Analyse van RNA-sequentie data kan zicht geven in de moleculaire werking die kunnen bijdragen aan het ontstaan van RA. (Sumitomo et al., 2018)

In deze studie werden RNA-sequentie data van gezonde controles en patiënten met reumatoïde artritis geanalyseerd. Met het R pakket DESeq2 werden differentieel genen die tot expressie gebracht waren geïdentificeerd. Vervolgens werd er een GO-analyse en een KEGG-pathway-analyse uitgevoerd om de biologische processen en signaalroutes te bepalen die betrokken zijn bij de veranderingen in genexpressie. Het doel van deze studie was om verschillen in genexpressie tussen gezonde en RA-monsters te identificeren en deze veranderingen te interpreteren.

# **Methode**
Bij dit onderzoek werd gebruikgemaakt van RNA-sequencing data van vier gezonde controles en vier patiënten met reumatoïde artritis. De analyse werd uitgevoerd met behulp van R.
De ruwe FASTQ-files werden eerst gemapt tegen het humane referentiegenoom (GRCh38) met behulp van het R-pakket Rsubread. Hiervoor werd een referentie-index opgebouwd met buildindex(), waarna paired-end reads werden uitgelijnd met align(). Vervolgens werd met featureCounts() het aantal reads per gen bepaald op basis van een GTF-bestand. Hierdoor werd er een countmatrix met genexpressiewaarden voor alle monsters verkregen.
Verschillen in genexpressie tussen gezonde en patiënten-monsters werden bepaald met het pakket DESeq2. De countmatrix en experimentele condities werden ingelezen in een DESeq2-object, waarna normalisatie en statistische analyse werd uitgevoerd. Genen met een aangepaste p-waarde (padj) kleiner dan 0,05 en een absolute log2 fold change groter dan 1 werden beschouwd als significant differentieel geëxpresseerd. De resultaten werden gevisualiseerd met een volcano plot.
Om de biologische betekenis van de gevonden genen te onderzoeken, werd een (GO)-analyse uitgevoerd met het pakket clusterProfiler. Hiermee werden overheersende biologische processen geïdentificeerd. Daarnaast werd er een KEGG pathway-analyse uitgevoerd. De pathway "Rheumatoid Arthritis" (hsa05323) werd gevisualiseerd met het pakket pathview, waardoor genexpressieveranderingen binnen bekende ziekte-gerelateerde signaalroutes konden worden bekeken en vergeleken.
De bijbehorend scripts kunnen worden gevonden in het mapje “Scripts”


+- 200 woorden
methode, flowschema. Zie leerdoelen voor minimale inhoud. Scripts, data etc. kunnen in een aparte folder met verwijzing.

# **Resultaten**
*max overlap = dan in onbeperkt? (connettors)*
+- 200 woorden
inclusief correcte verwijzingen, check log-fold

**Volcano plot**

<img width="692" height="460" alt="Volcano plot" src="https://github.com/user-attachments/assets/7091a423-c351-4ac6-88c3-73bbfe390350" />

**Barplot**

<img width="692" height="460" alt="Barplot" src="https://github.com/user-attachments/assets/7f7044ef-29af-469d-ab6d-c4cbb037a4b2" />

**Rheumatoid arthritis pathway**

<img width="746" height="429,5" alt="hsa05323 pathview" src="https://github.com/user-attachments/assets/0f9d33c6-6b24-44ad-b4e8-a21e8f2376d4" />






# **Conclusie**
+- 200 woorden
inclusief aanbevelingen en onderzoek in context plaatsen.

# **uitleg competentie beheren**
kijk op BB voor hulpvragen
o File (bijvoorbeeld een md file) met uitleg over Data Stewardship
o File met uitleg over toepassing beheren met GitHub
