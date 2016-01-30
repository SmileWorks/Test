# sets working directory 
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

#imports all data
gunrate <- read.csv("data/gunrate.csv")
homicides <- read.csv("data/homicides.csv")

#merges data based on country
data <- merge(gunrate,homicides,by=c("country"))



#testing output
sink("output/testoutput.txt", append=FALSE, split=TRUE)
cor.test(data$ownership.rate,data$homicide.rate)
