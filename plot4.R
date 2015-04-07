# Set up working directory which points to the .txt file
setwd("~/Education/R Studio/Exploratory Data Analysis")

# Read data, subset only 2007-02-01 and 2007-02-02 and check classes and look at data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")

str(data)
head(data)
data <- subset(data, subset = Date %in% c("1/2/2007", "2/2/2007"))

# Construct new column to indicate date and time
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

# Plot 4 --> use squares to depict picture
# Starting left-top --> clockwise
png(filename="plot4.png", width = 500, height = 500)
par(mfrow = c(2, 2))

# Plot 4.1
plot(data$DateTime, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

# Plot 4.2
plot(data$DateTime, data$Voltage, ylab = "Voltage", type = "l", xlab = "dateTime")

# Plot 4.3 --> lose the line around the legend --> bty = "n"
plot(data$DateTime, data$Sub_metering_1, col="black", xlab="", ylab="Energy sub metering", type="l")
+ lines(data$DateTime, data$Sub_metering_2, col="red")
+ lines(data$DateTime, data$Sub_metering_3, col="blue")
+ legend("topright",bty = "n", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=1)

# Plot 4.4 
plot(data$DateTime, data$Global_reactive_power, xlab = "dateTime", ylab = "Global_reactive_power", type = "l")
dev.off()
