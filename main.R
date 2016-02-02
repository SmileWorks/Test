# sets working directory 
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

#imports all data
gunrate <- read.csv("data/gunrate.csv")
homicides <- read.csv("data/homicides.csv")

#merges data based on country
data <- merge(gunrate,homicides,by=c("country"))

plot(data$ownership.rate, data$homicide.rate, ann=F)
title(main="Intentional Homicide Rate Vs Gun Ownership Rate by Country", 
      xlab="Gun Ownership Rate (per 100 people)",ylab="Intentional Homicide Rate (per 100 000 people)")
abline(lm(data$homicide.rate~data$ownership.rate),col="red")

#testing output
#sink("output/testoutput.txt", append=FALSE, split=TRUE)
#cor.test(data$ownership.rate,data$homicide.rate)
