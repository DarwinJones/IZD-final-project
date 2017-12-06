
library(shiny)

my.ui <- fluidPage(
    # page title
    titlePanel("Speed Dating Experiment"),
    
    sidebarPanel(
        conditionalPanel(condition="input.conditionedPanels==2",
                        helpText("Isaiah")
            
        ),
        conditionalPanel(condition="input.conditionedPanels==3",
                         helpText("Zach"),
                        
        column(12,offset=1,
        div(style = "font-size: 30px; padding:10px;",
        radioButtons(inputId = "Buttons", "What Would You Like To Find Out?", 
                     choices = c("What Men Think Men Want", 
                                 "What Men Think Women Want", 
                                 "What Women Think Women Want", 
                                 "What Women Think Men Want"))))                
                          
        ),
        conditionalPanel(condition="input.conditionedPanels==4",
                         helpText("Darwin"),
                         p('test')
        )
    ),
    
    mainPanel(
        tabsetPanel( type = "tabs",
                     tabPanel("About", value = 1,
                              includeMarkdown("description.md")),
                     tabPanel("Isaiah", value = 2),
                     tabPanel("Zach", value = 3, graphOutput("graph")),
                     tabPanel("Darwin", value = 4),
                     id = "conditionedPanels"
        )
    )
)