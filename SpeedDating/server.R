##install.packages("plotly")
library(plotly)
library(dplyr)
library(shiny)
library(ggplot2)

colors <- c('rgb(211,94,96)', 
            'rgb(128,133,133)', 
            'rgb(144,103,167)', 
            'rgb(171,104,87)', 
            'rgb(114,147,203)')

data <- read.csv("./SpeedDating/data/genderData.csv")

my.server <- function(input,output)
{
    output$graph <- renderPlot({
      if (input$Buttons == "What Men Think Men Want")
      {
        p <- plot_ly(data, labels = ~Categorie, values = ~X1960, type = 'pie') %>%
        layout(title = "How Important ss each Trait?",
               xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
               yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
      }
      if (input$Buttons == "What Men Think Women Want")
      {
        
      }
      if (input$Buttons == "What Women Think Women Want")
      {
        
      }
      if (input$Buttons == "What Women Think Men Want")
      {
        
      }
    })
  
  
}