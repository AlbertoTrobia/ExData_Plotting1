data <- read.csv("./power_consumption/household_power_consumption.txt", sep=";")

dataSelection <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## Plot 2
## ------

library(lubridate)
dataSelection$NewDate <- paste(dataSelection$Date, dataSelection$Time)
dataSelection$NewDate2 <- dmy_hms(dataSelection$NewDate) 
with(dataSelection[!is.na(dataSelection$NewDate2),], plot(NewDate2, Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)"))

