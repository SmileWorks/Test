guns <- read.csv("C:/Users/Nick/Desktop/Research Project/DATA/guns.csv")
homicidescountry <- read.csv("C:/Users/Nick/Desktop/Research Project/DATA/homicidescountry.csv")
plot(guns$rate,homicidescountry$rate,main="Intentional Homicide vs Gun Ownership rate by country", xlab="Gun Ownership rate (per 100 people)", ylab="Intentional homicide (per 100 000 people)")
cor.test(guns$rate,homicidescountry$rate)