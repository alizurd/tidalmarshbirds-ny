## standardizing using the vegan package instead of manually like I previously did

install.packages("vegan")
library(vegan)
setwd("~/Desktop")
sharp <- read.csv("SHARP_surveyData_2014.csv", stringsAsFactors = FALSE)
View(sharp)
colnames(sharp) <- tolower(colnames(sharp))
keep_columns <- c("state"
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
## convert the columns to numerics using as.numeric
## drop some of the columns as needed
sharp <- aggregate(. ~ surveydate, data=sharp[,keep_columns], FUN = sum)
decostand(sharp, method = "standardize", na.rm = FALSE)
View(sharp)
