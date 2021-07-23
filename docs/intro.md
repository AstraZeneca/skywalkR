### How it works

SkywalkR is a UI for a recommendation system that re-ranks CRISPR hits from Osimertinib resistance CRISPR screens. By bringing the most intersting genes on top it helps scientists to focus their efforts on the most promising markers of secondary resistance in lung cancer. We framed this task as a multi-objective optimisation problem. We rely on skyline computation to find the best solutions (gene targets) [Liu et al, 2015](https://www.cs.sfu.ca/~jpei/publications/Pareto%20Optimal%20Groups%20VLDB16.pdf) according to objectives defined by the users.

We have assembled a hybrid dataset that contains clinical, preclinical, literature and graph-derived features.  

**Sliders**:

Reranking happens based on selected objectives (sliders on the left). For every slider there are 3 possible positions:

- **low** - when optimizing we favour low values of a variable;
- **high** - when optimizing we favour high values of a variable;
- **exclude** - the variable is not used for optimization, so won't influence the ranking.

**NB** excluding some variables from the optimization does not linearly result in more genes being recommended as optimal. It depends on the underlying data. In some cases when we rank based on fewer metrics it is easier to find optimal solutions that stand out from the rest, so the number of top genes can get smaller (counterintuitively).

**Buttons**:

- To trigger re-ranking press ``rank!`` button once you are happy with the sliders&filters.
- ``reset`` button sets all sliders to their default values. Please note, ``reset`` does not trigger new list reranking, to re-rank after a reset just press ``rank!``

**Results**:

As a result of optimization we find a Pareto surface that contains all the optimal solutions according to the selected objectives and optimization directions. The more objectives are chosen, the larger and more complex the surface can get. Please note, this surface contains solutions with diverse trade-offs so precise ranking within the surface depends on user preferences. At the moment we present the results sorted according to ``full_screen`` variable by default.  
