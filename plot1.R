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

# Plot 1 --> use squares to depict picture
png(filename="plot1.png", width = 500, height = 500)
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()