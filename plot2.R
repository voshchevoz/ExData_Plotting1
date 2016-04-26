# The script does not have any prerequisites and is reentrable:
# one can run it several time with the stable and reproducible results.
# All required files will be downloaded automatically.

# This scripts does not utilize any 3rd party R packages: only base R

# This scripts does the following:
# 1. Reads "Individual household electric power consumption Data Set".
# 2. Plots line plot "Global_active_power" by "datetime" to the file Plot2.png

source("readData.R")

data <- readData()

# fire up png device
png(filename = "Plot2.png")

plot(data$datetime, data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()