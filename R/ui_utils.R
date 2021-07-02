library(shiny)

sliderTextInput01 <- function(id, label, selected, choices = USUAL_OPTIONS){
  # ui function to reduce duplication of slider settings
  sliderTextInput(
    inputId = id,
    label = label,
    choices = choices,
    grid = FALSE,
    selected = selected)
}