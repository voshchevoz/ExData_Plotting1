source("readData.R")

data <- readData()

# fire up png device
png(filename = "Plot4.png")

# init 2x2 canvas
par(mfrow=c(2,2))

# first plot
plot(data$datetime, data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

# second plot
with(data, plot(datetime, Voltage, type = "l"))

# third plot
plot(data$datetime, data$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy sub metering")

lines(data$datetime, data$Sub_metering_1, type = "l")
lines(data$datetime, data$Sub_metering_2, type = "l", col = "red")
lines(data$datetime, data$Sub_metering_3, type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2",
                              "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n")

# forth plot
with(data, plot(datetime, Global_reactive_power, type = "l"))

dev.off()