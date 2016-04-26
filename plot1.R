source("readData.R")

data <- readData()

# fire up png device
png(filename = "Plot1.png")

hist(data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()