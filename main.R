# sets working directory 
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

#imports all data
gunOwnershipRate <- read.csv("data/gunOwnershipRate.csv")
homicideRate <- read.csv("data/homicideRate.csv")
grossNationalIncomePerCapita <- read.csv("data/grossNationalIncomePerCapita.csv")
HDIRank <- read.csv("data/HDIRank.csv")
HDIValue <- read.csv("data/HDIValue.csv")
homicideByFirearmRate <- read.csv("data/homicideByFirearmRate.csv")
lifeExpectancyAtBirth<- read.csv("data/lifeExpectancyAtBirth.csv")
meanYearsOfSchooling <- read.csv("data/meanYearsOfSchooling.csv")
region <- read.csv("data/region.csv")
subregion <- read.csv("data/subregion.csv")
#averageIQ <- read.csv("data/averageIQ.csv")
#violentCrime <- read.csv("data/violentCrime.csv")

#merges data based on country
data <- merge(GunOwnershipRate,HomicideRate,by=c("country"))
data <- merge(data, grossNationalIncomePerCapita, by=c("country"))
data <- merge(data, HDIRank, by=c("country"))
data <- merge(data, HDIValue, by=c("country"))
data <- merge(data, homicideByFirearmRate, by=c("country"))
data <- merge(data, lifeExpectancyAtBirth, by=c("country"))
data <- merge(data, meanYearsOfSchooling, by=c("country"))
data <- merge(data, region, by=c("country"))
data <- merge(data, subregion, by=c("country"))
#data <- merge(data, averageIQ, by=c("country"))
#data <- merge(data, violentCrime, by=c("country"))

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

testAndPlotCorrelation(data$HDIRank, data$homicideRate, 
                       "Human Development Index Rank vs Intentional Homicide Rate by Country", 
                       "Human Development Index Rank", "Intentional Homicide Rate (per 100 000 people)")

testAndPlotCorrelation(data$HDIValue, data$homicideRate, 
                       "Human Development Index Value vs Intentional Homicide Rate by Country", 
                       "Human Development Index Value", "Intentional Homicide Rate (per 100 000 people)")

testAndPlotCorrelation(data$HDIRank, data$homicideRate, 
                       "Human Development Index Value vs Intentional Homicide Rate by Country", 
                       "Human Development Index Value", "Intentional Homicide Rate (per 100 000 people)")

testAndPlotCorrelation(data$homicideByFirearmRate, data$homicideRate, 
                       "Homicide By Firearm Rate vs Intentional Homicide Rate by Country", 
                       "Homicide By Firearm Rate (per 100 000 people?)", "Intentional Homicide Rate (per 100 000 people)")

testAndPlotCorrelation(data$lifeExpectancyAtBirth, data$homicideRate, 
                       "Life Expectancy (At Birth) vs Intentional Homicide Rate by Country", 
                       "Life Expectancy (At Birth)", "Intentional Homicide Rate (per 100 000 people)")

testAndPlotCorrelation(data$meanYearsOfSchooling, data$homicideRate, 
                       "Mean Years of Schooling vs Intentional Homicide Rate by Country", 
                       "Mean Years of Schooling", "Intentional Homicide Rate (per 100 000 people)")

#testAndPlotCorrelation(data$averageIQ, data$homicideRate, 
                      # "Average IQ vs Intentional Homicide Rate by Country", 
                      # "Average IQ", "Intentional Homicide Rate (per 100 000 people)")



