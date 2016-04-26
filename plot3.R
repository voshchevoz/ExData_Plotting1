# The script does not have any prerequisites and is reentrable:
# one can run it several time with the stable and reproducible results.
# All required files will be downloaded automatically.

# This scripts does not utilize any 3rd party R packages: only base R

# This scripts does the following:
# 1. Reads "Individual household electric power consumption Data Set".
# 2. On the same plot draws following line plots. Resuls are written to Plot3.png
#    * "Sub_metering_1" by "datetime"
#    * "Sub_metering_2" by "datetime"
#    * "Sub_metering_3" by "datetime"

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