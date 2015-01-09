#Plot3

# read the data file 
data <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

# creates a new col "newdate" with date format dd-mm-yyyy
data$newdate <- as.Date(data$Date, "%d/%m/%Y")    

# subset only Feb/01/2007 and Feb/02/2007 dates using "newdate" variable  
dataonly <- data[which(data[, "newdate"] == "2007-02-01" | data[, "newdate"] == "2007-02-02"),]

# creates a new col "datetime" combining Date and Time varibles,with format dd-mm-yyyy HH:MM:SS
dataonly$datetime <- as.POSIXct(paste(dataonly$Date, dataonly$Time), format="%d/%m/%Y %H:%M:%S")


# plot creation 

png(filename="plot3.png", width = 480, height = 480)   ##open png file

plot(dataonly$datetime, dataonly$Sub_metering_1, type = "n", ylab = "Energy Sub metering", xlab ="")
lines(dataonly$datetime, dataonly$Sub_metering_1, col = "black")
lines(dataonly$datetime, dataonly$Sub_metering_2, col = "red")
lines(dataonly$datetime, dataonly$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()   ## close png


