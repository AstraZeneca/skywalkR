## Definitions of objectives & filters used for multi-objective optimization


#### Essentiality

- **depmap**

  ``definition:`` gene essentiality according to DepMap. **NB**: essentiality is used for exact filtering only, excluded from optimization).

  ``default radio button value:`` nonessential;

#### Tractability

- **trct_ab**

  ``definition:``: Tractability with antibodies, based on reversed [OpenTargets buckets](https://docs.targetvalidation.org/getting-started/target-tractability). Metrics used in this recsys app are obtained as following: ``trct_ab = 10 - OpenTargets bucket, antibodies``.

  ``default slider position``: exclude;

- **trct_sm**   

  ``definition:`` Tractability with small molecules, based on reversed [OpenTargets buckets](https://docs.targetvalidation.org/getting-started/target-tractability); Metrics used in this recsys app are obtained as following: ``trct_sm = 10 - OpenTargets bucket, small molecules``.

  ``default slider position``: high;

- **trct_om**

  ``definition:`` Tractability with other modalities (e.g. enzyme, protein, oligonucleotide, etc.), based on reversed [OpenTargets buckets](https://docs.targetvalidation.org/getting-started/target-tractability); Metrics used in this recsys app are obtained as following: ``trct_om = 10 - OpenTargets bucket, other modalities``.

  ``default slider position``: exclude;

#### literature support

- **lit_nsclc**

  ``definition:`` number of papers mentioning NSCLC + a candidate gene in a cancer resistance context

  ``default slider position``: high;

- **lit_egfr**

  ``definition:`` number of papers mentioning EGFR + a candidate gene in a cancer resistance context

  ``default slider position``: high;  
  
- **lit_nsclc_norm**

  ``definition:`` % of papers mentioning NSCLC + a candidate gene in a cancer resistance context over all papers that mention a given gene.

  ``default slider position``: exclude;

- **lit_egfr_norm**

  ``definition:``  % of papers mentioning EGFR + a candidate gene in a cancer resistance context over all papers that mention a given gene.

  ``default slider position``: exclude;  
  
- **lit_total**

  ``definition:`` total number of papers that mention a given gene.

  ``default slider position``: exclude;  

#### Knowledge Graph (KG) graph-derived  

- **L2_egfr**

  ``definition:`` [L2-based distance](https://github.com/facebookresearch/faiss) from a target gene node to EGFR gene node calculated based on KG-derived RESCAL embeddings.

  ``default slider position``: exclude;  

- **L2_egfr**

  ``definition:`` [L2-based distance](https://github.com/facebookresearch/faiss) from a target gene node to NSCLC disease node calculated based on KG-derived RESCAL embeddings.

  ``default slider position``: exclude;  

- **n_neighbours**

  ``definition:`` number of unique neighbours connected to a node in the full KG.

  ``default slider position``: exclude;  

- **n_edges**

  ``definition:`` number of edges connected to a node in the full KG.

  ``default slider position``: exclude;  

- **degree**

  ``definition:`` node degree in PPI subgraph extracted from KG graph.

  ``default slider position``: exclude;  

- **pagerank**

  ``definition:`` a measure of 'popularity' of a node in PPI subgraph extracted from KG. PageRank is an algorithm used to rank websites in Google’s search results. It counts the number, and quality, of links to a page which determines an estimation of how important the page is. The underlying assumption is that pages of importance are more likely to receive a higher volume of links from other pages.

  ``default slider position``: exclude;  

- **betweenness**

  ``definition:`` betweenness centrality is a way of detecting the amount of influence a node has over the flow of information in a graph. It is often used to find nodes that serve as a bridge from one part of a graph to another. Calculated on PPI subgraph.

  ``default slider position``: exclude;  


#### Consistency in CRISPR screens

- **full_screen**

  ``definition:`` summary consistency metric across all cell lines in both CRISPRn and CRISPRa screens;

  ``default slider position``: high / exclude;

- **KO_osi**

  ``definition:`` CRISPRn assay, knock-out, number of cell lines treated with osimertinib where a gene is labelled as a hit;

  ``default slider position``: exclude;  

- **KO_gefi**

  ``definition:`` CRISPRn assay, knock-out, number of cell lines treated with gefitinib where a gene is labelled as a hit;

  ``default slider position``: exclude;  

- **KO_all**

  ``definition:`` CRISPRn assay, knock-out, number of cell lines across full EGFR screen (both osi and gefi treatments) where a gene is labelled as a hit;

  ``default slider position``: high;  

- **A_osi**

  ``definition:`` CRISPRa assay, activation, number of cell lines treated with osimertinib where a gene is labelled as a hit;

  ``default slider position``: exclude;

- **A_gefi**

  ``definition:`` CRISPRa assay, activation, number of cell lines treated with gefitinib where a gene is labelled as a hit;

  ``default slider position:`` exclude;

- **A_all**

  ``definition:`` CRISPRa assay, activation, number of cell lines across full EGFR screen (both osi and gefi treatments) where a gene is labelled as a hit;

  ``default slider position``: high;  

#### Clinical relevance

- **clin_ES1**

  ``definition:`` clinical study 1, enrichment_score is row.RESISTANT / (row.RESISTANT + row.RESPONDERS), where the comparison is RESPONDERS vs RESISTANT. So, higher the score, more number of resistant patients carry the marker.;

  ``default slider position``: high;

- **clin_ES2**

 ``definition:`` clinical study 2, enrichment_score is row.RESISTANT / (row.RESISTANT + row.RESPONDERS), where the comparison is RESPONDERS vs RESISTANT. So, higher the score, more number of resistant patients carry the marker.;

  ``default slider position``: high;


- **clin_ES3**

  ``definition:`` cross-clinical study enrichment score;

  ``default slider position``: high;


#### Preclinical evidence

**OsiAcute RNAseq**

Data from internal RNAseq study. Please note for re-ranking we use absolute value of LFC, though in the TopResults table LFCs are shown with their exact signs for user convenience.

- **OsiAcute_LFC**

``definition:`` log2 fold change from internal RNAseq study, where cancer cell lines were treated with osimertinib vs DMSO treatment;

``default slider position:`` exclude.

- **OsiAcute_adjpval**

``definition:`` adjusted p-values associated with LFC;

``default slider position:`` exclude.
