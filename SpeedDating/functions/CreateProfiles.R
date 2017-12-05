library(tidyverse)

# No need to run again
speeddate <- read.csv("Data/Speed Dating Data.csv")

# turns date data into table that give stats about individual participants
# pRate is an average of partners ratings
profile <- speeddate %>% group_by(ID) %>% drop_na(pRatingAttractive, pRatingSincere, pRatingIntelligent, pRatingFun, pRatingAmbitious, pRatingSharedInterests) %>% 
    summarize(gender = mean(gender), matchPercent = mean(match), pRateAttr = mean(pRatingAttractive), pRateSincere = mean(pRatingSincere), 
              pRateIntell = mean(pRatingIntelligent), pRateFun = mean(pRatingFun), pRateAmb = mean(pRatingAmbitious), pRateShared = mean(pRatingSharedInterests),
              pApproval = mean(partnerDecision), pLikePercent = mean(pLike),
              importanceRace = mean(imprace), importanceReligion = mean(imprelig), wantsAttr = mean(attr1_1), wantsSincere = mean(sinc1_1),
              wantsIntell = mean(intel1_1), wantsFun = mean(fun1_1), wantsAmb = mean(amb1_1), wantsShared = mean(shar1_1),
              otherGenderWantsAttr = mean(attr2_1), otherGenderWantsIntell = mean(intel2_1), otherGenderWantsFun = mean(fun2_1),
              otherGenderWantsAmb = mean(amb2_1), otherGenderWantsShared = mean(shar2_1), selfRateAttr = mean(attr3_1),
              selfRateSincere = mean(sinc3_1), selfRateIntell = mean(intel3_1), selfRateFun = mean(fun3_1),
              selfRateAmb = mean(amb3_1), sameGenderWantsAttr = mean(attr4_1), sameGenderWantsSincere = mean(sinc4_1),
              sameGenderWantsIntell = mean(intel4_1), sameGenderWantsFun = mean(fun4_1), sameGenderWantsAmb = mean(amb4_1),
              sameGenderWantsShared = mean(shar4_1))

write.csv(profile, file = "profileData.csv")

# crap I found an easier way to to that

# Gives same data but grouped by gender
genderData <- profile %>% group_by(gender) %>% drop_na() %>% summarize_all(funs(mean))
write.csv(genderData, file = "genderData.csv")