## This script generates the plot2 as described in ExData_Plotting1 assignment
library(data.table)

# Read in the file and explicitly mention missing values denoted by ?
# This is total data ~130MB!
tpowerDT <- data.table::fread(input = "./data/household_power_consumption.txt",
                              na.strings = "?"
                              )
# Convert Date variable to Date class such that time is visible as well
tpowerDT[, dateTime:=as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")]

# Subset the DT for dates between 2007-02-01 and 2007-02-02
spowerDT <- tpowerDT[(dateTime >= "2007-02-01") & (dateTime <= "2007-02-03")]

# Set up the graphics device for 480x480 pixels with a file name plot2.png
png("plot2.png", width = 480, height = 480)

# Plot the graph from the subset
plot(x=spowerDT[, dateTime],
     y=spowerDT[, Global_active_power], 
     #main = "Global Active Power",  # No title requested in question
     type="l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)" 
     )
# Close the graphics device
dev.off()
