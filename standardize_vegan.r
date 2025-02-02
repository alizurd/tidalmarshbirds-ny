## standardizing using the vegan package instead of manually like I previously did

install.packages("vegan")
library(vegan)
setwd("~/Desktop")
sharp <- read.csv("SHARP_surveyData_2014.csv", stringsAsFactors = FALSE)
View(sharp)
colnames(sharp) <- tolower(colnames(sharp))

str(sharp)

sharp$tempf <- as.numeric(sharp$tempf)
sharp$windsp <- as.numeric(sharp$windsp)
sharp$sky <- as.numeric(sharp$sky)
sharp$noise <- as.numeric(sharp$noise)
sharp$surveydaye <- as.Date(sharp$surveydate)

## keep_columns <- c("state"
                  ,"pointid" 
                  ,"point_x" 
                  ,"point_y" 
                  ,"patchid" 
                  ,"visitnum" 
                  ,"surveydate" 
                  ,"tide" 
                  ,"surveytime"
                  ,"tempf"
                  ,"windsp"
                  ,"noise"
                  ,"alphacode"
                  ,"distance"
                  ,"totalcountn")

keep_columns <- c("pointid"
                  , "alphacode"
                  , "totalcountn"
                  , "windsp"
                  , "noise"
                  , "distance")

## convert the columns to numerics using as.numeric
## drop some of the columns as needed

## checks
nrow(sharp)
unique(sharp$surveydate)
unique(sharp$pointid)
sharp <- aggregate(.~alphacode, data=sharp[,keep_columns], FUN = sum)

##decostand(sharp, method = "standardize", na.rm = FALSE)

View(sharp)
install.packages("ggplot2")
library(ggplot2)
ggplot(sharp, aes(x=alphacode)) +
  geom_bar()
