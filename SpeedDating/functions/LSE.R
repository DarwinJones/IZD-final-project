# This function calculates the least square error of users judgement of their attributes
# and the participants of the survey and returns the row with the least difference

#ask me later if I managed to take the mean stats if there was a tie
library(dplyr)
library(tidyr)

LSE <- function(profileData, attr, sinc, int, fun, amb) {
    calc <- profileData %>% mutate(LSE = (selfRateAttr - attr)^2 + 
                                                     (selfRateSincere - sinc)^2 +
                                                 (selfRateIntell - int)^2 +
                                                 (selfRateFun - fun)^2 +
                                                 (selfRateAmb - amb)^2) %>%
        drop_na(LSE) %>% filter(LSE == min(LSE))
    match <- calc %>% summarise_all(funs(mean))
    return(match)
}