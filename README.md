# **Differentiële genexpressie bij reumatoïde artritis wijst op activatie van adaptieve immuunresponsen**

# **Inhoud & Structuur**
* **Scripts/** - Gebruikte scripts
* **Resultaten/** - Grafieken en tabellen
* **Bronnen/** - Gebruikte bronnen
* **README.md/** het document om de tekst hier te genereren

# **Introductie**
Reumatoïde artritis (RA) is een chronische auto-immuunziekte die wordt gekenmerkt door aanhoudende ontsteking van de gewrichten. Deze ontsteking veroorzaakt pijn, zwelling en beschadiging van kraakbeen en bot. Zowel aangeboren als adaptieve immuunreacties spelen een belangrijke rol bij het ontstaan en in stand houden van de ziekte, waarbij onder andere T-cellen, B-cellen en macrofagen betrokken zijn (McInnes & Schett, 2007).

Met de ontwikkeling van RNA-sequencing (RNA-seq) is het mogelijk geworden om veranderingen in genexpressie op grote schaal te onderzoeken. Deze techniek maakt het mogelijk duizenden genen gelijktijdig te analyseren en verschillen tussen gezonde personen en patiënten te identificeren. Hierdoor kunnen moleculaire mechanismen die bijdragen aan het ontstaan en de progressie van RA beter worden begrepen (Sumitomo et al., 2018).

Hoewel RA uitgebreid is onderzocht, is nog niet volledig duidelijk welke genen en biologische processen het sterkst verschillen tussen gezonde personen en RA-patiënten. Een beter inzicht hierin kan bijdragen aan het begrijpen van de ziekteprocessen die ten grondslag liggen aan RA. Daarom werden in deze studie RNA-seq-data van synoviumbiopten van gezonde controles en RA-patiënten geanalyseerd. Met DESeq2 werden differentieel geëxpresseerde genen geïdentificeerd, gevolgd door GO- en KEGG-analyses. Het doel van deze studie was het identificeren van verschillen in genexpressie en de daarbij betrokken biologische processen en een signaalroute.

Gebruikte bronnen zijn te vinden in het mapje "Bronnen"

# **Methode**
<img width="1562" height="456" alt="image" src="https://github.com/user-attachments/assets/3cfc1a46-19fc-464a-93db-7d893c955114" />

Voor dit onderzoek werd gebruikgemaakt van paired-end RNA-sequencingdata van vier gezonde controles en vier patiënten met reumatoïde artritis afkomstig uit Platzer et al. (2019). De analyse werd uitgevoerd in R (versie 4.5.2).

De ruwe FASTQ-bestanden werden gemapt tegen het humane referentiegenoom (GRCh38, versie GCF_000001405.40) met behulp van het pakket Rsubread. Eerst werd een referentie-index opgebouwd met buildindex(), waarna paired-end reads werden uitgelijnd met align(). Vervolgens werd met featureCounts() het aantal reads per gen bepaald op basis van een GTF-bestand, wat resulteerde in een countmatrix met genexpressiewaarden voor alle monsters.
Verschillen in genexpressie tussen gezonde controles en RA-patiënten werden geanalyseerd met DESeq2. Na normalisatie en statistische analyse werden genen met een aangepaste p-waarde (padj) < 0,05 en een absolute log2 fold change > 1 beschouwd als significant differentieel geëxpresseerd. De resultaten werden gevisualiseerd met een volcano plot.
Om de biologische betekenis van deze genen te onderzoeken, werden GO- en KEGG-analyses uitgevoerd met clusterProfiler. Daarnaast werd de KEGG-pathway Rheumatoid Arthritis (hsa05323) gevisualiseerd met pathview om genexpressieveranderingen binnen ziekte-gerelateerde signaalroutes te bestuderen.

Alle scripts, ruwe data en analysebestanden zijn opgenomen in de mappen Scripts, Data en Resultaten.



# **Resultaten**
Om verschillen in genexpressie tussen gezonde controles en patiënten met reumatoïde artritis te identificeren, werd  data geanalyseerd met behulp van DESeq2, gevolgd door een GO-analyse en een KEGG-analyse.

### **Differentiële genexpressie**
Na het mappen van de  reads en analyse met DESeq2 werden in totaal 29.407 genen onderzocht. Hiervan werden 4.572 genen als significant differentieel geëxpresseerd gevonden tussen gezonde controles en patiënten met reumatoïde artritis (padj < 0,05 en |log2FoldChange| > 1). Van deze genen waren er 2.085 verhoogd tot expressie en 2.487 verlaagd tot expressie in de groep met reumatoïde artritis.

De volcano plot (Figuur 1) geeft de expressieveranderingen van alle 29.407 onderzochte genen aan. Hiervan werden 4.572 genen als significant differentieel geëxpresseerd geïdentificeerd. Voorbeelden van genen met een verhoogde expressie zijn CD28 (log2FC = 3,82), SRGN (log2FC = 3,26) en CXCL8 (log2FC = 8,89) en met verlaagde expressie zijn ANKRD30BL (log2FC = -10,11), SLC9A3R2 (log2FC = -5,61) en BAX (Log2FC = -3,47)

### **Gene Ontology analyse**
De GO-analyse identificeerde in totaal 323 significante GO-termen (padj < 0,05). De sterkst verrijkte biologische processen waren lymphocyte differentiation, adaptive immune response, B cell mediated immunity en immune response-regulating cell surface receptor signaling pathway (Figuur 2).

### **KEGG pathway analyse**
Daarnaast werd de KEGG-pathway Rheumatoid Arthritis (hsa05323) gevisualiseerd met behulp van Pathview (Figuur 3). Binnen deze pathway werden verschillende genen met verhoogde expressie aangetroffen, waaronder IL1B, IFNG, TLR2, TLR4, CXCL1 en CD28. De pathwayvisualisatie liet zien dat meerdere genen binnen deze signaalroute veranderde expressieniveaus vertoonden ten opzichte van de controlegroep.

**Volcano plot**

<img width="692" height="460" alt="Volcano plot" src="https://github.com/user-attachments/assets/7091a423-c351-4ac6-88c3-73bbfe390350" />

Figuur 1. Volcano plot van verschillen in genexpressie tussen gezonde controles en patiënten met reumatoïde artritis. Elk punt geeft een gen aan. De x-as toont de log2FoldChange en de y-as de gecorrigeerde p-waarde. Genen met significante veranderingen in expressie (padj < 0,05 en log2FC > 1) zijn zichtbaar aan de linker en de rechterkant van de plot.

**GO-analyse barplot**

<img width="1208" height="460" alt="image" src="https://github.com/user-attachments/assets/843fa1b6-0bf7-4eee-9085-fa79bb822730" />

Figuur 2. Top 10 verschillen in biologische processen uit de GO-analyse. De analyse werd uitgevoerd op significant geëxpresseerde genen (padj < 0,05 en log2FC > 1). De weergegeven GO-termen zijn gerangschikt op significantie en laten zien welke biologische processen het sterkst vertegenwoordigd zijn binnen de dataset.

**Rheumatoid arthritis pathway**

<img width="746" height="429,5" alt="hsa05323 pathview" src="https://github.com/user-attachments/assets/0f9d33c6-6b24-44ad-b4e8-a21e8f2376d4" />

Figuur 3. Visualisatie van de KEGG-pathway Rheumatoid Arthritis (hsa05323) met behulp van Pathview. Genen zijn ingekleurd op basis van hun log2FoldChange tussen patiënten met reumatoïde artritis en gezonde controles. Rood geeft verhoogde expressie weer, groen geeft verlaagde expressie aan. Meerdere genen binnen immuun en ontstekingsroutes vertoonden veranderde expressieniveaus.


# **Conclusie**
In deze studie werd RNA-sequencingdata van gezonde controles en patiënten met reumatoïde artritis geanalyseerd om verschillen in genexpressie te identificeren. Met behulp van DESeq2 werden 4.572 significant differentieel geëxpresseerde genen gevonden. De GO-analyse liet zien dat vooral immuungerelateerde processen verrijkt waren, waaronder lymphocyte differentiation, adaptive immune response en B cell mediated immunity. Daarnaast toonde de KEGG-analyse van de Rheumatoid Arthritis-pathway verhoogde expressie van meerdere ontstekingsgerelateerde genen, waaronder IL1B, IFNG, TLR2, TLR4 en CD28.
Deze resultaten komen overeen met een studie over reumatoïde artritis als een chronische auto-immuunziekte waarbij sprake is van een ontregeling is van zowel het aangeboren als de adaptieve immuniteit die een belangrijke rol speelt bij reumatoïde artritis (Smolen et al., 2020). Ook sluiten de bevindingen aan bij een eerdere studie waarbij transcriptomics was gebruikt, in deze studie werd er een verhoogde activiteit van immuuncellen en ontstekingsroutes bij patiënten met eumatoïde artritis gevonden (Zhang et al., 2019).
Een beperking van deze studie is het relatief kleine aantal monsters en het gebruik van subsets van de sequencingdata. Toekomstig onderzoek kan gebruik maken van grotere datasets en aanvullende validatiemethoden, zoals qPCR. Deze resultaten laten zien dat transcriptomics een geschikte methode is om biologische processen en signaalroutes die betrokken zijn bij reumatoïde artritis in kaart te brengen.

Gebruikte bronnen zijn te vinden in het mapje "Bronnen"

##**Nog doen!!**
**uitleg competentie beheren**
kijk op BB voor hulpvragen
o File (bijvoorbeeld een md file) met uitleg over Data Stewardship
o File met uitleg over toepassing beheren met GitHub

**checken R script juist geupdate**
**spelling/gramatica check**
**Alle bronnen toegevoegd in het mapje**
**rubric document nog nachecken**
**in methode is statistiek goed aangegeven, nu goed volledig verhaal?, extra bronnen of mist er nog een bron in de bronnenlijst + AI disclaimer**
**Bestandnamen aanpassen naar datum**
**BAM-files toevoegen**



# **Bronnenlijst**

McInnes, I., Schett, G. Cytokines in the pathogenesis of rheumatoid arthritis. Nat Rev Immunol 7, 429–442 (2007). https://doi.org/10.1038/nri2094

Platzer A, Nussbaumer T, Karonitsch T, Smolen JS, Aletaha D (2019) Analysis of gene expression in rheumatoid arthritis and related conditions offers insights into sex-bias, gene biotypes and co-expression patterns. PLoS ONE 14(7): e0219698. https://doi.org/10.1371/journal.pone.0219698

Smolen J, Aletaha D, McInnes I, Rheumatoid arthritis, The Lancet, 2016; 388, 2023-2038 https://doi.org/10.1016/S0140-6736(16)30173-8

Sumitomo, S., Nagafuchi, Y., Tsuchida, Y. et al. Transcriptome analysis of peripheral blood from patients with rheumatoid arthritis: a systematic review. Inflamm Regener 38, 21 (2018). https://doi.org/10.1186/s41232-018-0078-5

Zhang, F., Wei, K., Slowikowski, K. et al. Defining inflammatory cell states in rheumatoid arthritis joint synovial tissues by integrating single-cell transcriptomics and mass cytometry. Nat Immunol 20, 928–942 (2019). https://doi.org/10.1038/s41590-019-0378-1
