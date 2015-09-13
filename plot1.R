setInternet2(use=TRUE)
source <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(source, destfile="power_consumption.zip")
data <- read.csv(unz("power_consumption.zip", "household_power_consumption.txt"), sep=";")

dataSelection <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## Plot 1
## ------

dataSelection$Global_active_power <- as.character(dataSelection$Global_active_power)
dataSelection$Global_active_power <- as.numeric(dataSelection$Global_active_power)
hist(dataSelection$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.copy(png, file="plot1.png", width = 480, height = 480, bg ="white")
dev.off()
