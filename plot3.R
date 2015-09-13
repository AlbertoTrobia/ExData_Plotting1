setInternet2(use=TRUE)
source <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(source, destfile="power_consumption.zip")
data <- read.csv(unz("power_consumption.zip", "household_power_consumption.txt"), sep=";")

dataSelection <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## Plot 3
## ------

library(lubridate)
dataSelection$NewDate <- paste(dataSelection$Date, dataSelection$Time)
dataSelection$NewDate2 <- dmy_hms(dataSelection$NewDate) 

with(dataSelection[!is.na(dataSelection$NewDate2),], plot(NewDate2, Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering"))
with(dataSelection[!is.na(dataSelection$NewDate2),], points(NewDate2, Sub_metering_2, col="red", type="l", xlab="", ylab=""))
with(dataSelection[!is.na(dataSelection$NewDate2),], points(NewDate2, dataSelection$Sub_metering_3, col="blue", type="l", xlab="", ylab=""))

legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.75)

dev.copy(png, file="plot3.png", width = 480, height = 480, bg ="white")
dev.off()

