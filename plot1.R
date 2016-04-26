# The script does not have any prerequisites and is reentrable:
# one can run it several time with the stable and reproducible results.
# All required files will be downloaded automatically.

# This scripts does not utilize any 3rd party R packages: only base R

# This scripts does the following:
# 1. Reads "Individual household electric power consumption Data Set".
# 2. Plots histogram of "Global_active_power" variable to the file Plot1.png

source("readData.R")

data <- readData()

# fire up png device
png(filename = "Plot1.png")

hist(data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()