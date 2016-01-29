gunrate <- read.csv("C:/Users/Nick/Desktop/Research Project/DATA/guns.csv")
homicides <- read.csv("C:/Users/Nick/Desktop/Research Project/DATA/homicidescountry.csv")
total <- merge(guns,homicidescountry,by=c("country"))