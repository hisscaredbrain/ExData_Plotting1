## This script generates the plot1 as described in ExData_Plotting1 assignment
library(data.table)

# Read in the file and explicitly mention missing values denoted by ?
# This is total data ~130MB!
tpowerDT <- data.table::fread(input = "./data/household_power_consumption.txt",
                              na.strings = "?"
                              )
# Convert Date variable to Date class
tpowerDT[, Date:=lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols=c("Date")]

# Subset the DT for dates between 2007-02-01 and 2007-02-02
spowerDT <- tpowerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

# Set up the graphics device for 480x480 pixels with a title plot1.png
png("plot1.png", width = 480, height = 480)

# Plot the histogram from the subset
hist(spowerDT[, Global_active_power], main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
# Close the graphics device
dev.off()
