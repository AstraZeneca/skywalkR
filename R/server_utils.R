library(rPref)
library(dplyr)
library(formattable)

# helper functions for the back-end 
pareto_helper <- function(metrics_df,
                          funs,
                          return_pref = FALSE,
                          num_objectives,
                          skip_cols = 4) {

  # perform Pareto optimization for a given set of objectives
  # metrics_df - a table with pre-aggregated metrics for optimization

  funs <- case_when(funs == 'close' ~ 'low',
                    funs == 'far' ~ 'high',
                    funs == 'min' ~ 'low',
                    funs == 'max' ~ 'high',
                    TRUE ~ funs)

  pareto_factory <- function(fun) {
    # function factory to produce base pareto preferences
    pfun <- get(fun)
    return(pfun)
  }

  # skip gene names & filters, first columns on the left
  #vars <- names(metrics_df)[4:ncol(metrics_df)] # this bit can become buggy
  vars <- names(metrics_df)[skip_cols:ncol(metrics_df)] 
  names(funs) <- names(vars) <-
    sapply(1:num_objectives, function(x)
      paste0('obj_', as.character(x)))

  ok_funs <- funs[funs != 'exclude']
  ok_vars <- vars[funs != 'exclude']

  # a list of base pareto prefs, which are also functions
  pfuns <- sapply(ok_funs, pareto_factory)

  # map pareto sub_funcs to a list of variables
  prefs <- Map(do.call, pfuns, lapply(ok_vars[names(pfuns)], list))
  pp <- Reduce('*', prefs)
  res <- psel(metrics_df, pp, top = nrow(metrics_df))

  if (return_pref == TRUE) {
    pp
  } else {
    res
  }
}


any_filter <- function(df,flt_d, colName = 'depmap'){
  # a helper function for essentiality filtering
  if (flt_d != 'exclude') {
    f1 <- dplyr::filter(df, .data[[colName]] == flt_d)
  } else {
    f1 <- df
  }
  return(f1)
}

# formatter functions for TopGenes table
sign_formatter <- formatter("span",
  style = x ~ style(color = ifelse(x > 0, "green",
    ifelse(x < 0, "red", "black"))))

depmap_formatter <- formatter("span",
    style = ~ formattable::style(color = ifelse(depmap == 'essential',"red",
      ifelse(depmap == 'nonessential',"green", NA))))
