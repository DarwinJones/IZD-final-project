

library(dplyr)
library(shiny)
library(ggplot2)

##setwd("C:/Users/zjrya/Desktop/INFO_201/IZD-final-project/SpeedDating/")

data <- read.csv("data/genderData.csv")

newColumns <- c("Attractive", "Sincere", "Intelligence", "Fun", "Ambitious", "Shared Interests")


dataMM <- data[2, 15:20]
  colnames(dataMM) <- newColumns
  numbersMM <- as.numeric(dataMM[1,])
  dataMM <- data.frame(newColumns, numbersMM)
dataMW <- data[2, 21:26]
  colnames(dataMW) <- newColumns
  numbersMW <- as.numeric(dataMW[1,])
  dataMW <- data.frame(newColumns, numbersMW)
dataWW <- data[1, 15:20]
  colnames(dataWW) <- newColumns
  numbersWW <- as.numeric(dataWW[1,])
  dataWW <- data.frame(newColumns, numbersWW)
dataWM <- data[1, 21:26]
  colnames(dataWM) <- newColumns
  numbersWM <- as.numeric(dataWM[1,])
  dataWM <- data.frame(newColumns, numbersWM)
  
source("functions/LSE.R")
source("functions/ratingPlot.R")
profileData <- read.csv("data/profileData.csv")

my.server <- function(input,output) {
    output$graph <- renderPlot({
      if (input$Buttons == "What Men Want")
      {
        p <- ggplot(data=dataMM, aes(x = newColumns, y = numbersMM, fill = newColumns)) +
          geom_bar(stat="identity", width = 1) +
          geom_text(aes(label= round(numbersMM, digits = 2)), vjust=1.6, color="white", size=3.5)+
          theme_minimal() +
          labs(x = "", y = "", fill = "") + theme(axis.title.x=element_blank(),
                                       axis.text.x=element_blank(),
                                       axis.ticks.x=element_blank())
        print(p)
      }
      else if (input$Buttons == "What Men Think Women Want")
      {
        p <- ggplot(data=dataMW, aes(x = newColumns, y = numbersMW, fill = newColumns)) +
          geom_bar(stat="identity", width = 1) +
          geom_text(aes(label= round(numbersMW, digits = 2)), vjust=1.6, color="white", size=3.5)+
          theme_minimal() +
          labs(x = "", y = "", fill = "") + theme(axis.title.x=element_blank(),
                                                  axis.text.x=element_blank(),
                                                  axis.ticks.x=element_blank())
        print(p)
      }
      else if (input$Buttons == "What Women Want")
      {
        p <- ggplot(data=dataWW, aes(x = newColumns, y = numbersWW, fill = newColumns)) +
          geom_bar(stat="identity", width = 1) +
          geom_text(aes(label= round(numbersWW, digits = 2)), vjust=1.6, color="white", size=3.5)+
          theme_minimal() +
          labs(x = "", y = "", fill = "") + theme(axis.title.x=element_blank(),
                                                  axis.text.x=element_blank(),
                                                  axis.ticks.x=element_blank())
        print(p)
      }
      else (input$Buttons == "What Women Think Men Want")
      {
        p <- ggplot(data=dataWM, aes(x = newColumns, y = numbersWM, fill = newColumns)) +
          geom_bar(stat="identity", width = 1) +
          geom_text(aes(label= round(numbersWM, digits = 2)), vjust=1.6, color="white", size=3.5)+
          theme_minimal() +
          labs(x = "", y = "", fill = "") + theme(axis.title.x=element_blank(),
                                                  axis.text.x=element_blank(),
                                                  axis.ticks.x=element_blank())
          print(p)
      }
    })
  
    # finds participant most like user
    closestMatch <- reactive({
    LSE(profileData, as.numeric(input$attractive),as.numeric(input$sincere),
        as.numeric(input$intel), as.numeric(input$fun),
        as.numeric(input$ambition))
  })

  
  #text report for matching stats
  output$amoreStats <- renderUI({
      #predicted percent match
      matchp <-  round(as.numeric(closestMatch()$matchPercent)*100,digits = 2)
      #predicted like %
      likep <- round(as.numeric(closestMatch()$pApproval)*100,digits = 2)
      #predicted score out of 10
      likenum <- round(as.numeric(closestMatch()$pLikePercent), digits = 1)
      str1 <- paste0("Your Match Percentage: ", matchp,"%")
      str2 <- paste0("Percent of Partners that would like you: ", likep, "%")
      str3 <- paste0("Total value as a human being: ", likenum,"/10")
      HTML(paste(str1, str2,str3, sep = '<br/>'))
  })
 
    #plot
  output$pJudge <- renderPlot({
      p <- ratingPlot(closestMatch)
      print(p)
  })
}