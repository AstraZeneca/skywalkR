![Maturity level-Prototype](https://img.shields.io/badge/Maturity%20Level-Prototype-red)

## skywalkR

This repository contains code and documentation to accompany Gogleva et al manuscript: **Knowledge Graph-based Recommendation Framework Identifies Novel Drivers of Resistance in EGFR mutant Non-small Cell Lung Cancer**. 

To read the pre-print please follow: https://www.biorxiv.org/content/10.1101/2021.07.23.453506v1.full.pdf+html

The repository has the following structure:

```
.
├── DESCRIPTION
├── CONTRIBUTING.md
├── LICENSE
├── 🛠️ R --> helper functions for shiny apps
│   ├── server_utils.R
│   └── ui_utils.R
├── README.md
├── renv.lock
├── 💾 data --> necessary input data and sample data files
│   ├── app_data.csv
│   ├── heatmap_data.tsv
│   ├── mtcars.csv
│   ├── nlp_allowed.csv
│   └── sample_data.csv
├── 📄 docs --> within the app documentation
│   ├── intro.md
│   ├── intro_light.md
│   ├── pareto_bar_explained.md
│   ├── pareto_hist_explained.md
│   └── variables_explained.md
├── 🖼️ img --> readme plots
│   ├── skywalkR_interface.png
│   └── skywalkr_light_interface.png
├── 🧬 skywalkR_app.R --> main Shiny app
re-rank CRISPR hits to find promising genes driving drug
resistance in EGFR mutant lung cancer;
└── 🧪 skywalkR_light_app.R --> a demo shiny app,
input any table to test out how multi-objective optimisation works;
```

### SkywalkR app

This Shiny app is tailored to finding genes driving resistance in EGFR mutant Non-small Cell Line Cancer (NSCLC). The app will automatically load required data. To re-rank genes set directions of optimization by moving sliders and press ``rank!`` button.

![skywalkr_app](https://github.com/AstraZeneca/skywalkR/blob/master/img/skywalkR_interface.png)


### SkywalkR_light app

This is a generic app, bare bones app that allows users to apply the same idea of multi-objective optimization to their own data. Any tabular numeric data should work. To include categorical data, please represent it as numeric. By default we will treat the first column as labels. Columns will be automatically mapped to sliders.

![skywalkr_light_app](https://github.com/AstraZeneca/skywalkR/blob/master/img/skywalkR_light_interface.png)


### Running apps

To install all the packages required to run the apps, call ``renv::restore()`` as declared in the lockfile. Typically, it can take a few minutes to install the dependencies, depending on which ones are already installed in your environment.

After installing run the respective app, it should start immediately:

``R -e "shiny::runApp('skywalkR_light_app.R')"``

or

``R -e "shiny::runApp('skywalkR_app.R')"``

Typical start time for the app 10-20 seconds. Time estimates are provided for MacBook Pro, 6-Core Intel Core i7, 2.6 GHz, 6 cores, 32 GB, Big Sur.
