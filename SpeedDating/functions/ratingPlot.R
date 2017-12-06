# This function takes in a row of a data table and creates a graph of 
# Their partners opinions about them

library(dplyr)
library(ggplot2)
library(scales)

ratingPlot <- function(closestMatch) {
    # get things in plotable format
    # new names
    Attributes <-  c("Attractiveness", "Sincerity", "Intelligence", "Fun", "Ambition", "Shared Interests")
    # colnames are now rows. values still belong to the same attribute
    plotable <- data.frame(Attributes,AvgRating = round(c(closestMatch()$pRateAttr, closestMatch()$pRateSincere,
                                                    closestMatch()$pRateIntell, closestMatch()$pRateFun,
                                                    closestMatch()$pRateAmb, closestMatch()$pRateShared),digits = 2))
    #Barchart, colored, with data labels
    p <- ggplot(plotable, aes(x=Attributes, y=AvgRating, fill = Attributes)) +
        geom_bar(stat = "identity") +
        geom_text(aes(label = round(AvgRating, digits = 2))) +
        geom_label(aes(label = AvgRating)) +
        scale_y_continuous(limits = c(0, 10)) +
        theme(legend.position="none",plot.title = element_text(hjust = 0.5)) +
        labs(title = "Here's what your partners will think about you")
    
}