
library(shiny)
library(shinyFiles)
library(shinypanels)


# UI ----------------------------------------------------------------------

ui <- fluidPage(
  shinyFilesButton('files', label='File select', title='Please select a file', multiple=FALSE),
  verbatimTextOutput('rawInputValue'),
  tableOutput('filepaths')
)


# SERVER ------------------------------------------------------------------

server <- function(input, output) {
  
  roots = c(wd='.')
  shinyFileChoose(input, 'files', roots=roots)
  
  output$rawInputValue <- renderPrint({
    str(input$files)
  })
  
  output$filepaths <- renderTable({
    parseFilePaths(roots, input$files)
  })
  
}


# RUN ---------------------------------------------------------------------

shinyApp(ui, server)


# END ---------------------------------------------------------------------
