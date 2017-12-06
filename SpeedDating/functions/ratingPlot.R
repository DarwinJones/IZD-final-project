# This function takes in a row of a data table and creates a graph of 
# Their partners opinions about them

library(dplyr)
library(ggplot2)
library(scales)

ratingPlot <- function(closestMatch) {
    # get things in plotable format
    # new names
    Attributes <-  c("Attractiveness", "Sincerity", "Intelligence", "Fun", "Ambition", "Shared Interests")
    # colnames are now rows
    plotable <- data.frame(Attributes,AvgRating = round(c(closestMatch()$pRateAttr, closestMatch()$pRateSincere,
                                                    closestMatch()$pRateIntell, closestMatch()$pRateFun,
                                                    closestMatch()$pRateAmb, closestMatch()$pRateShared),digits = 2))
    p <- ggplot(plotable, aes(x=Attributes, y=AvgRating, fill = Attributes)) +
        geom_bar(stat = "identity") +
        geom_text(aes(label = round(AvgRating, digits = 2))) +
        geom_label(aes(label = AvgRating)) +
        scale_y_continuous(limits = c(0, 10)) +
        theme(legend.position="none",plot.title = element_text(hjust = 0.5)) +
        labs(title = "Here's what your partners will think about you")
    
    
#     selectVars <- personalData %>% select(pRateAttr, pRateSincere, pRateIntell, pRateFun, pRateAmb, pRateShared)
#     Attributes <-  c("Attractiveness", "Sincerity", "Intelligence", "Fun", "Ambition", "Shared Interests")
#     partnerRatings <- as.numeric(selectVars[1,])
#     ranks <- data.frame(Attributes, partnerRatings)
#     
#     plot <- ggplot(ranks,aes(x=Attributes, y=partnerRatings, fill = Attributes)) + 
#         geom_bar(stat = "identity") +
#         geom_text(aes(label = partnerRatings)) +
#         geom_label(aes(label = partnerRatings)) +
#         scale_y_continuous(limits = c(0, 10)) +
#         theme(legend.position="none") +
#         labs(title = "Here's what your partners thought about you")
}