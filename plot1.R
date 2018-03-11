plot1 <- function (){
  
  library("stringr")
  library("dplyr");
  
  data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE, na.strings = "?");
  
  data$Date <- as.Date(data$Date, "%d/%m/%Y");
  
  filtered <- filter(data, Date == "2007-02-01" | Date == "2007-02-02");
  
  hist(filtered$Global_active_power, breaks=12, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)");
  
  dev.copy(png, "plot1.png");
  dev.off();
  
  return("plot1 created.");
}