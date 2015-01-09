#Plot4

# read the data file 
data <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

# creates a new col "newdate" with date format dd-mm-yyyy
data$newdate <- as.Date(data$Date, "%d/%m/%Y")    

# subset only Feb/01/2007 and Feb/02/2007 dates using "newdate" variable  
dataonly <- data[which(data[, "newdate"] == "2007-02-01" | data[, "newdate"] == "2007-02-02"),]

# creates a new col "datetime" combining Date and Time varibles,with format dd-mm-yyyy HH:MM:SS
dataonly$datetime <- as.POSIXct(paste(dataonly$Date, dataonly$Time), format="%d/%m/%Y %H:%M:%S")


# plot creation 

png(filename="plot4.png", width = 480, height = 480)   ##open png file

par(mfrow = c(2,2))      ## create plot slots (2x2)

#4.1 = time vs global active power
plot(dataonly$datetime, dataonly$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(dataonly$datetime, dataonly$Global_active_power)

#4.2 = time vs voltage
plot(dataonly$datetime, dataonly$Voltage, type = "n", ylab = "Voltage", xlab ="datetime")
lines(dataonly$datetime, dataonly$Voltage)

#4.3 time vs energy submetering
plot(dataonly$datetime, dataonly$Sub_metering_1, type = "n", ylab = "Energy Sub metering", xlab ="")
lines(dataonly$datetime, dataonly$Sub_metering_1, col = "black")
lines(dataonly$datetime, dataonly$Sub_metering_2, col = "red")
lines(dataonly$datetime, dataonly$Sub_metering_3, col = "blue")
legend("topright", bty = "n" ,lty = 1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4.4 time vs gobal reactive power
plot(dataonly$datetime, dataonly$Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab ="datetime")
lines(dataonly$datetime, dataonly$Global_reactive_power)

dev.off()   ## close png

