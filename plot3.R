source("readData.R")

data <- readData()

# fire up png device
png(filename = "Plot3.png")

plot(data$datetime, data$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy sub metering")

lines(data$datetime, data$Sub_metering_1, type = "l")
lines(data$datetime, data$Sub_metering_2, type = "l", col = "red")
lines(data$datetime, data$Sub_metering_3, type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2",
                              "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1, 1))

dev.off()