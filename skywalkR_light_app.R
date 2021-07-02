library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(rPref)
library(DT)
library(tidyverse) 
source("R/server_utils.R", local = TRUE)

usual_options <- c('min', 'exclude', 'max')

validate_table <- function(data){
  
  # convention, first column contains labels
  warning('First column will be parsed as labels.')
  
  # check if all variables, except first column are numeric 
  trunc <- data[2:ncol(data)]
  if (!(all((sapply(trunc, class)) == 'numeric'))) {
    stop('All variables must be numeric. Please re-code categorical variables.')
  } 
  
  if (length(data) >= 5) {
    warning('Number of columns exceeds the limit of 5, extra columns will be truncated.')
    return(data[1:6]) 
  }
}

ui <- dashboardPage(
  skin = 'purple',
  dashboardHeader(title = 'skywalkR_light'),
  dashboardSidebar(sidebarMenu(
    id = 'mysidebar',
    fileInput("file", NULL, accept = c(".csv", ".tsv")),
    uiOutput("input_ui"),
    actionBttn(
      inputId = "rank",
      label = "rank!",
      style = "gradient",
      color = "royal",
      icon = icon("random"),
      size = 'sm'
    )
  )),
  dashboardBody(
    fluidRow(
    box(
        title = tagList(shiny::icon("lightbulb"), "How it works"),
        status = NULL, 
        solidHeader = TRUE,
        collapsible = TRUE,
        includeMarkdown('docs/intro_light.md'),
        width = 12
      ), 
    tabBox(
      title = 'Re-ranked data',
      id = 'tabset2',
      width = 12,
      tabPanel(
        title = tagList(shiny::icon("list-alt"), "Result"),
        DT::dataTableOutput("res"),
        downloadButton('Download',"Download results")
      )
    )
  )
))

server <- function(input, output) {
  
  data <- reactive({
      req(input$file)

      ext <- tools::file_ext(input$file$name)
      switch(ext,
             csv = vroom::vroom(input$file$datapath, delim = ","),
             tsv = vroom::vroom(input$file$datapath, delim = "\t"),
             validate("Invalid file; Please upload a .csv or .tsv file")
      ) %>% validate_table()
    })
  
  output$input_ui <- renderUI({
    total_objectives <- base::ncol(data())
    # skip labels column
    lapply(2:total_objectives, function(i) {
      options <- c('min', 'exclude', 'max')
      sliderTextInput(paste0("n_input_", i), 
                  label = names(data())[i],
                  choices = usual_options,
                  grid = FALSE,
                  selected = sample(options, 1))
    })
  })
  
  result <- reactive({
    total_objectives <- base::ncol(data())
    
    input$rank
    isolate({
      all_objectives <- NULL
      for (i in seq(total_objectives)) {
        all_objectives <- c(all_objectives,
                            input[[paste0("n_input_", as.character(i))]])
      }
    })
    
    if (length(all_objectives) != 0){
    data <- data()
    res <- pareto_helper(data[2:ncol(data)], all_objectives,
                         num_objectives = total_objectives - 1,
                         return_pref = FALSE,
                         skip_cols = 0)
    
    labelled <- full_join(data(), res) %>%
                distinct() %>%
                arrange(.level)
    }else{
    message('To see results, press "rank" button.')
    }
    
  })

  output$res <- DT::renderDataTable({
   ranked <- result()
  
  })
  
  output$Download <- downloadHandler(
    filename = function(){'ranking_results.csv'},
    content = function(fname){
      write.csv(result(), fname)
    }
  )
}

shinyApp(ui, server) 