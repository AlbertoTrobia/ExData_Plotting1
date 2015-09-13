setInternet2(use=TRUE)
source <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(source, destfile="power_consumption.zip")
data <- read.csv(unz("power_consumption.zip", "household_power_consumption.txt"), sep=";")

dataSelection <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## Plot 2
## ------

library(lubridate)
dataSelection$NewDate <- paste(dataSelection$Date, dataSelection$Time)
dataSelection$NewDate2 <- dmy_hms(dataSelection$NewDate) 
with(dataSelection[!is.na(dataSelection$NewDate2),], plot(NewDate2, Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)"))

dev.copy(png, file="plot2.png", width = 480, height = 480, bg ="white")
dev.off()

