## This script generates the plot4 as described in ExData_Plotting1 assignment
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

# Set up the graphics device for 480x480 pixels with a file name plot4.png
png("plot4.png", width = 480, height = 480)
# We need 4 subplots, lets fill it rowwise
par(mfrow=c(2,2))

# Plot(1,1) from the subset
plot(spowerDT[, dateTime], 
     spowerDT[, Global_active_power], 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power"
     )

# Plot (1,2) from the subset
plot(spowerDT[, dateTime], 
     spowerDT[, Voltage], 
     type = "l",
     xlab = "datetime", 
     ylab = "Voltage"
)

# Plot(2,1) from the subset
plot(x=spowerDT[, dateTime],
     y=spowerDT[, Sub_metering_1], 
     #main = "",  # No title requested in question
     type="l",
     xlab = "",
     ylab = "Energy sub metering" 
     )
lines(spowerDT[, dateTime], spowerDT[, Sub_metering_2], col="red")
lines(spowerDT[, dateTime], spowerDT[, Sub_metering_3], col="blue")
legend("topright",
       col = c("black", "red", "blue"),
       c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "),
       lty = c(1,1),
       bty = "n"
       #cex = 0.5
       #lwd = c(1,1)
       )

# Plot (2,2) from the subset
plot(spowerDT[, dateTime], 
     spowerDT[, Global_reactive_power], 
     type = "l",
     xlab = "datetime", 
     ylab = "Global_reactive_power"
)

# Close the graphics device
dev.off()
