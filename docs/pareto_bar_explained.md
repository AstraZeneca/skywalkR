This plot shows optimal genes according to specified objectives and directions of
optimization. To make comparison easier between candidate genes, values of all 
objectives have been rescaled within optimal genes to to have specified minimum (-1) 
and maximum (1). 


- **-1** corresponds to the lowest value of a metric rescaled according to values of the same metric within level 1 genes; 

- **1**  corresponds to the highest value of a metric rescaled according to values of the same metric within level 1 genes; 

With multiple objectives Pareto front can include quite a lot of genes, with just 
a few being optimal according to all the objectives. Majority of candidates will 
present interesting trade-offs and their combinations. Perhaps it could be 
useful to explore the full Pareto front, not just the optimal solutions.

More information about pareto optimization:

- [Finding Pareto Optimal Groups: Group-based Skyline](https://www.cs.sfu.ca/~jpei/publications/Pareto%20Optimal%20Groups%20VLDB16.pdf)

- [The Preference SQL System – An Overview](http://sites.computer.org/debull/A11june/p11.pdf)
