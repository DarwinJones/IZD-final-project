#hosted: https://darwinjones.shinyapps.io/speeddating2/

library(shiny)
library(markdown)
my.ui <- fluidPage(
    # page title
    titlePanel("Speed Dating Experiment"),
    
    sidebarPanel(
        conditionalPanel(condition="input.conditionedPanels==2",
                    
        div(style = "font-size: 30px; padding:10px;",
        radioButtons(inputId = "Buttons", "What Would You Like To Find Out?", 
                     choices = c("What Men Want", 
                                 "What Men Think Women Want", 
                                 "What Women Want", 
                                 "What Women Think Men Want")))               
                          
        ),
        conditionalPanel(condition="input.conditionedPanels==3",
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
                         sliderInput("sincere",
                                     "Sincerity",
                                     min = 1, 
                                     max = 10,
                                     value = 5)
        )
    ),
    # 3 tabs. one gives info about data, the other gives gender preferences of the 6 attributes
    # and the other compares Users and tries to predict their romantic success
    mainPanel(
        tabsetPanel( type = "tabs",
                     tabPanel("About", value = 1,
                              includeMarkdown("description.md")),
                     tabPanel("Dating Preferences", value = 2,
                              plotOutput("graph")),
                     tabPanel("Dat-oroscope", value = 3,
                              h1("The Only Data Based Relationship Tester"),
                              h5("measure yourself (or a friend) by these 5 attributes"),
                              plotOutput("pJudge"),
                              h1("Your Results"),
                              h3(htmlOutput("amoreStats"))),
                     id = "conditionedPanels"
        )
    )
)