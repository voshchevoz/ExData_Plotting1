# The script does not have any prerequisites and is reentrable:
# one can run it several time with the stable and reproducible results.
# All required files will be downloaded automatically.

# This scripts does not utilize any 3rd party R packages: only base R

# This scripts does the following:
# 1. Registeres readData() function that will download and unzip "Individual
#    household electric power consumption Data Set"
# 2. The function will merge "Date" amd time "Time" variables to "datetime"
#    variable of POSIXct type
     

readData <- function() {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  fileLocalPath <- "./data/Power_consumption.zip"
  
  if(!file.exists("data")) {
    dir.create("data")
  }
  
  if(!file.exists(fileLocalPath)) {
    print(paste("Downloading file to", fileLocalPath))
    
    # wb is required option for binary files
    download.file(fileUrl, fileLocalPath, mode = "wb")
    
    print("Downloading complete")
  } else {
    print(paste("File", fileLocalPath, "already exists"))
  }
  
  if(!file.exists("household_power_consumption.txt")) {
    print(paste("Unzipping files from", fileLocalPath))
    unzip(fileLocalPath)
    print("Unzipping complete")
  } else {
    print("File household_power_consumption.txt already exists, proceeding to import")
  }
  
  header <- read.table("household_power_consumption.txt", header = TRUE,
                       sep = ";", nrows = 1)
  
  # skipping data to read only 2007-02-01 and 2007-02-02
  data <- read.table("household_power_consumption.txt", header = FALSE,
                     sep = ";", na.string = "?",
                     skip = 66637, nrows = 69518 - 66638)
  
  colnames(data) <- colnames(header)
  
  # aggregate date and time columns to POSIXct,
  # we do not care about TZ here
  data["datetime"] <- as.POSIXct(paste(data$Date, data$Time),
                                  "%d/%m/%Y %H:%M:%S", tz = "")

  data
}