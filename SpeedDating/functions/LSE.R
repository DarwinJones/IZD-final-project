# This function calculates the least square error of users judgement of their attributes
# and the participants of the survey and returns the row with the least difference

LSE <- function(profileData, attr, sinc, int, fun, amb) {
    calc <- profileData %>% mutate(LSE = (selfRateAttr - attr)^2 + 
                                                     (selfRateSincere - sinc)^2 +
                                                 (selfRateIntell - int)^2 +
                                                 (selfRateFun - fun)^2 +
                                                 (selfRateAmb - amb)^2) %>%
                            arrange(LSE)
    match <- calc[1,]
    
    return(match)
}