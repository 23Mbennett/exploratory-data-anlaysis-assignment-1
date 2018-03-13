plot2 <- function (){
  library("stringr")
  library("dplyr");
  
  data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE, na.strings = "?");
  
  data$Date <- as.Date(data$Date, "%d/%m/%Y");
  
  filtered <- filter(data, Date == "2007-02-01" | Date == "2007-02-02");
  
  filtered$Time <- as.POSIXct(paste(filtered$Date, filtered$Time), format = "%Y-%m-%d %H:%M:%S");
  
  plot(y = filtered$Global_active_power, x = filtered$Time, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
  
  dev.copy(png, "plot2.png");
  dev.off();
  
  return("plot2 created")
}

