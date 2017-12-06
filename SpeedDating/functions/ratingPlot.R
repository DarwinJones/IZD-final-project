# This function takes in a row of a data table and creates a graph of 
# Their partners opinions about them

library(dplyr)
library(ggplot2)
library(scales)

ratingPlot <- function(personalData) {
    selectVars <- personalData %>% select(pRateAttr, pRateSincere, pRateIntell, pRateFun, pRateAmb, pRateShared)
    Attributes <-  c("Attractiveness", "Sincerity", "Intelligence", "Fun", "Ambition", "Shared Interests")
    partnerRatings <- as.numeric(selectVars[1,])
    ranks <- data.frame(Attributes, partnerRatings)
    
    plot <- ggplot(ranks,aes(x=Attributes, y=partnerRatings, fill = Attributes)) + 
        geom_bar(stat = "identity") +
        geom_text(aes(label = partnerRatings)) +
        geom_label(aes(label = partnerRatings)) +
        scale_y_continuous(limits = c(0, 10)) +
        theme(legend.position="none") +
        labs(title = "Here's what your partners thought about you")
}