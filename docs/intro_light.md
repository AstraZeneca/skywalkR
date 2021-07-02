### How it works

SkywalkR_light is a demo allowing users to test how multi-objective optimization on their own data. In this prototype we rely on Pareto optimization to find the best solutions (gene targets) [Liu et al, 2015](https://www.cs.sfu.ca/~jpei/publications/Pareto%20Optimal%20Groups%20VLDB16.pdf), [Roocks et al, 2016](https://doi.org/10.32614/RJ-2016-054) according to objectives defined by the users. Users can upload any table of features, which will be mapped to sliders. Please note, not more than 5 features will be considered. We also assume that the first column contain labels, so it will not be mapped to sliders.

**Sliders**:

Reranking happens based on selected objectives (sliders on the left). For every slider there are 3 possible positions:

- **low** - when optimizing we favour low values of a variable;
- **high** - when optimizing we favour high values of a variable;
- **exclude** - the variable is not used for optimization, so won't influence the ranking.

**Buttons**:
- press ``Browse`` button to select a tabular file;
- To trigger re-ranking press ``rank!`` button once you are happy with the sliders&filters.

**Results**:

As a result of Pareto optimization we find a surface that contains all the optimal solutions according to the selected objectives and optimization directions. The more objectives are chosen, the larger and more complex the surface can get. Please note, this surface contains solutions with diverse trade-offs so precise ranking within the surface depends on user preferences.    
