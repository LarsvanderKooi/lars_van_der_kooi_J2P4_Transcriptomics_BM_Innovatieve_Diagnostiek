# **Project Transcriptomics J2P4**

# **Inhoud & Structuur**
* **Scripts/** - Gebruikte scripts
* **Resultaten/** - Grafieken en tabellen
* **Bronnen/** - Gebruikte bronnen
* **README.md/** het document om de tekst hier te genereren
* **assets/** - overige documenten voor de opmaak van deze pagina

# **Introductie**
Reumatoïde artritis is een chronische auto-immuunziekte waarbij langdurige ontsteking van de gewrichten aanwezig zijn bij patiënten. Deze ontsteking leidt tot pijn, zwelling en beschadiging van kraakbeen en bot. Reumatoïde artritis ontstaat door een verstoring van het immuunsysteem, waarbij zowel aangeboren als adaptieve immuunreacties zijn betrokken. T-cellen, B-cellen en macrofagen, spelen een belangrijke rol bij het in stand houden van de ontstekingsreactie. (McInnes & Schett, 2007)

Door de ontwikkeling van RNA-sequencing (RNA-seq) is het mogelijk om veranderingen in genexpressie op een grotere schaal te onderzoeken. RNA-seq maakt het mogelijk om duizenden genen tegelijkertijd te analyseren en verschillen tussen gezonde en zieke individuen te vergelijken. Analyse van RNA-sequentie data kan zicht geven in de moleculaire werking die kunnen bijdragen aan het ontstaan van RA. (Sumitomo et al., 2018)

In deze studie werden RNA-sequentie data van gezonde controles en patiënten met reumatoïde artritis geanalyseerd. Met het R pakket DESeq2 werden differentieel genen die tot expressie gebracht waren geïdentificeerd. Vervolgens werd er een GO-analyse en een KEGG-pathway-analyse uitgevoerd om de biologische processen en signaalroutes te bepalen die betrokken zijn bij de veranderingen in genexpressie. Het doel van deze studie was om verschillen in genexpressie tussen gezonde en RA-monsters te identificeren.

Gebruikte bronnen zijn te vinden in het mapje "Bronnen"

# **Methode**
<img width="1562" height="456" alt="image" src="https://github.com/user-attachments/assets/3cfc1a46-19fc-464a-93db-7d893c955114" />

Bij dit onderzoek werd gebruikgemaakt van RNA-sequencing data van vier gezonde controles en vier patiënten met reumatoïde artritis. De analyse werd uitgevoerd met behulp van R.
De ruwe FASTQ-files werden eerst gemapt tegen het humane referentiegenoom (GRCh38) met behulp van het R-pakket Rsubread. Hiervoor werd een referentie-index opgebouwd met buildindex(), waarna paired-end reads werden uitgelijnd met align(). Vervolgens werd met featureCounts() het aantal reads per gen bepaald op basis van een GTF-bestand. Hierdoor werd er een countmatrix met genexpressiewaarden voor alle monsters verkregen.
Verschillen in genexpressie tussen gezonde en patiënten-monsters werden bepaald met het pakket DESeq2. De countmatrix en experimentele condities werden ingelezen in een DESeq2-object, waarna normalisatie en statistische analyse werd uitgevoerd. Genen met een aangepaste p-waarde (padj) kleiner dan 0,05 en een absolute log2 fold change groter dan 1 werden beschouwd als significant differentieel geëxpresseerd. De resultaten werden gevisualiseerd met een volcano plot.
Om de biologische betekenis van de gevonden genen te onderzoeken, werd een (GO)-analyse uitgevoerd met het pakket clusterProfiler. Hiermee werden overheersende biologische processen geïdentificeerd. Daarnaast werd er een KEGG pathway-analyse uitgevoerd. De pathway "Rheumatoid Arthritis" (hsa05323) werd gevisualiseerd met het pakket pathview, waardoor genexpressieveranderingen binnen bekende ziekte-gerelateerde signaalroutes konden worden bekeken en vergeleken.

De bijbehorend scripts kunnen worden gevonden in het mapje “Scripts”, verdere bestanden waaronder de Count matrix, DESeq2 file, GO-resultaten en het Metadata kunnen worden gevonden in het mapje "Resultaten"


# **Resultaten**
Na het mappen van de RNA-sequencing reads en analyse met DESeq2 werden in totaal 29.407 genen onderzocht. Hiervan werden 4.572 genen als significant geëxpresseerd gevonden tussen gezonde controles en patiënten met reumatoïde artritis (padj < 0,05 en |log2FoldChange| > 1). Van deze genen waren er 2.085 verhoogd tot expressie en 2.487 verlaagd tot expressie in de groep met reumatoïde artritis.

De volcano plot (Figuur 1) laat zien dat meerdere genen sterke veranderingen in expressie vertoonden ten opzichte van de controle. Voorbeelden van genen met een verhoogde expressie zijn CD28 (log2FC = 3,82), SRGN (log2FC = 3,26) en CXCL8 (log2FC = 8,89) en met verlaagde expressie zijn ANKRD30BL (log2FC = -10,11), SLC9A3R2 (log2FC = -5,61) en BAX (Log2FC = -3,47)

De GO-analyse identificeerde in totaal 323 significant GO-termen (padj < 0,05). De sterkst verrijkte biologische processen waren lymphocyte differentiation, adaptive immune response, B cell mediated immunity en immune response-regulating cell surface receptor signaling pathway (Figuur 2).

Daarnaast werd de KEGG-pathway Rheumatoid Arthritis (hsa05323) gevisualiseerd met behulp van Pathview (Figuur 3). Binnen deze pathway werden verschillende genen met verhoogde expressie aangetroffen, waaronder IL1B, IFNG, TLR2, TLR4, CXCL1 en CD28. De pathwayvisualisatie liet zien dat meerdere genen binnen deze signaalroute veranderde expressieniveaus vertoonden ten opzichte van de controlegroep.

**Volcano plot**

<img width="692" height="460" alt="Volcano plot" src="https://github.com/user-attachments/assets/7091a423-c351-4ac6-88c3-73bbfe390350" />

Figuur 1. Volcano plot van verschillen in genexpressie tussen gezonde controles en patiënten met reumatoïde artritis. Elk punt geeft een gen aan. De x-as toont de log2FoldChange en de y-as de gecorrigeerde p-waarde. Genen met significante veranderingen in expressie (padj < 0,05 en log2FC > 1) zijn zichtbaar aan de linker en de rechterkant van de plot.

**GO-analyse barplot**

<img width="692" height="460" alt="Barplot" src="https://github.com/user-attachments/assets/7f7044ef-29af-469d-ab6d-c4cbb037a4b2" />

Figuur 2. Top 10 verschillen in biologische processen uit de GO-analyse. De analyse werd uitgevoerd op significant geëxpresseerde genen (padj < 0,05 en log2FC > 1). De weergegeven GO-termen zijn gerangschikt op significantie en laten zien welke biologische processen het sterkst vertegenwoordigd zijn binnen de dataset.

**Rheumatoid arthritis pathway**

<img width="746" height="429,5" alt="hsa05323 pathview" src="https://github.com/user-attachments/assets/0f9d33c6-6b24-44ad-b4e8-a21e8f2376d4" />

Figuur 3. Visualisatie van de KEGG-pathway Rheumatoid Arthritis (hsa05323) met behulp van Pathview. Genen zijn ingekleurd op basis van hun log2FoldChange tussen patiënten met reumatoïde artritis en gezonde controles. Rood geeft verhoogde expressie weer, groen geeft verlaagde expressie aan. Meerdere genen binnen immuun en ontstekingsroutes vertoonden veranderde expressieniveaus.


# **Conclusie**
In deze studie werd RNA-sequencing data van gezonde controles en patiënten met reumatoïde artritis geanalyseerd om verschillen in genexpressie te identificeren. Met behulp van DESeq2 werden 4.572 significant differentieel geëxpresseerde genen gevonden. De GO-analyse liet zien dat vooral immuungerelateerde processen verrijkt waren, waaronder lymphocyte differentiation, adaptive immune response en B cell mediated immunity. Daarnaast toonde de KEGG-analyse van de Rheumatoid Arthritis-pathway verhoogde expressie van meerdere ontstekingsgerelateerde genen, waaronder IL1B, IFNG, TLR2, TLR4 en CD28.
Deze resultaten komt overeen met een studie over reumatoïde artritis als een chronische auto-immuunziekte waarbij er een ontregeling is van zowel het aangeboren als het adaptieve immuniteit die een belangrijke rol speelt bij reumatoïde artritis (Smolen et al., 2020). Ook sluiten de bevindingen aan bij een eerdere studie waarbij transcriptomics was gebruikt, in deze studie werd er een verhoogde activiteit van immuuncellen en ontstekingsroutes bij reumatoïde artritis patiënten gevonden (Zhang et al., 2019).
Een beperking van deze studie is het relatief kleine aantal monsters en het gebruik van subsets van de sequencingdata. Toekomstig onderzoek kan gebruikmaken van meer en grotere datasets en het gebruiken van meer validatiemethoden, zoals qPCR. Het gebruik van transcriptomics  toont aan dat dit een goede methode is om biologische processen en signaalroutes betrokken bij in dit geval reumatoïde artritis in kaart te brengen.

Gebruikte bronnen zijn te vinden in het mapje "Bronnen"

##**Nog doen!!**
**uitleg competentie beheren**
kijk op BB voor hulpvragen
o File (bijvoorbeeld een md file) met uitleg over Data Stewardship
o File met uitleg over toepassing beheren met GitHub

**checken R script juist geupdate**
**spelling/gramatica check**
**Alle bronnen toegevoegd in het mapje**
**Feedback verwerken**
**rubric document nog nachecken**
