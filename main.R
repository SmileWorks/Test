# sets working directory 
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

#imports all data
gunOwnershipRate <- read.csv("data/gunOwnershipRate.csv")
homicideRate <- read.csv("data/homicideRate.csv")
grossNationalIncomePerCapita <- read.csv("data/grossNationalIncomePerCapita.csv")

#merges data based on country
data <- merge(GunOwnershipRate,HomicideRate,by=c("country"))
data <- merge(data, grossNationalIncomePerCapita, by=c("country"))


#write overall data to file
write.csv(data, "output/data.csv", row.names=FALSE)

testAndPlotCorrelation <- function(x, y, title, xlabel, ylabel)
{
  png(filename=paste("figs/",title,".png"), 
      units="in", width=10, height=8, pointsize=12, res=72)
  plot(data$gunOwnershipRate, data$homicideRate, ann=F)
  title(main=title, 
        xlab=xlabel,ylab=ylabel)
  abline(lm(y~x),col="red")
  dev.off()
  
  sink(paste("output/", title,".txt"))
  print(cor.test(x, y))
  sink()
}

testAndPlotCorrelation(data$gunOwnershipRate, data$homicideRate, 
                       "Intentional Homicide Rate vs Gun Ownership Rate by Country", 
                "Gun Ownership Rate (per 100 people)", "Intentional Homicide Rate (per 100 000 people)")

testAndPlotCorrelation(data$grossNationalIncomePerCapita, data$homicideRate, 
                       "Gross National Income Per Capita vs Intentional Homicide Rate by Country", 
                       "Gross National Income Per Capita (in US Dollars?)", "Intentional Homicide Rate (per 100 000 people)")



#testing output
#sink("output/testoutput.txt", append=FALSE, split=TRUE)
#cor.test(data$ownership.rate,data$homicide.rate)
