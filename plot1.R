data <- read.csv("./power_consumption/household_power_consumption.txt", sep=";")

dataSelection <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## Plot 1
## ------

dataSelection$Global_active_power <- as.character(dataSelection$Global_active_power)
dataSelection$Global_active_power <- as.numeric(dataSelection$Global_active_power)
hist(dataSelection$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
