
library(shiny)

my.ui <- fluidPage(
    # page title
    titlePanel("Speed Dating Experiment"),
    
    sidebarPanel(
        conditionalPanel(condition="input.conditionedPanels==2",
                        helpText("Isaiah")
            
        ),
        conditionalPanel(condition="input.conditionedPanels==3",
                         helpText("Zach")
                         
        ),
        conditionalPanel(condition="input.conditionedPanels==4",
                         helpText("Darwin"),
                         p('test')
        )
    ),
    
    mainPanel(
        tabsetPanel( type = "tabs",
                     tabPanel("About", value = 1),
                     tabPanel("Isaiah", value = 2),
                     tabPanel("Zach", value = 3),
                     tabPanel("Darwin", value = 4),
                     id = "conditionedPanels"
        )
    )
)