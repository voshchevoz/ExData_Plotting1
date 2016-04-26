source("readData.R")

data <- readData()

# fire up png device
png(filename = "Plot2.png")

plot(data$datetime, data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()