
library(shiny)

my.ui <- fluidPage(
    # page title
    titlePanel("Speed Dating Experiment"),
    
    sidebarPanel(
        conditionalPanel(condition="input.conditionedPanels==3",
                    
        div(style = "font-size: 30px; padding:10px;",
        radioButtons(inputId = "Buttons", "What Would You Like To Find Out?", 
                     choices = c("What Men Think Men Want", 
                                 "What Men Think Women Want", 
                                 "What Women Think Women Want", 
                                 "What Women Think Men Want")))               
                          
        ),
        conditionalPanel(condition="input.conditionedPanels==4",
                         helpText("Rate Yourself"),
                         sliderInput("ambition",
                                     "Ambition",
                                     min = 1, 
                                     max = 10,
                                     value = 5),
                         sliderInput("attractive",
                                     "Attractiveness",
                                     min = 1, 
                                     max = 10,
                                     value = 5),
                         sliderInput("fun",
                                     "Fun",
                                     min = 1, 
                                     max = 10,
                                     value = 5),
                         sliderInput("intel",
                                     "Intelligence",
                                     min = 1, 
                                     max = 10,
                                     value = 5),
                         sliderInput("shared",
                                     "Shared Interests",
                                     min = 1, 
                                     max = 10,
                                     value = 5)
        )
    ),
    
    mainPanel(
        tabsetPanel( type = "tabs",
                     tabPanel("About", value = 1,
                              includeMarkdown("description.md")),
                     tabPanel("Zach", value = 3,
                              plotOutput("graph")),
                     tabPanel("Darwin", value = 4),
                     id = "conditionedPanels"
        )
    )
)