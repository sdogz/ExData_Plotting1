# Read partial of data
epc <- read.csv("household_power_consumption.txt", na.string = "?", sep = ";", nrows = 70000)

# subset data 2007-02-01 00:00:00 - 2007-02-02 23:59:00
epc$Date <- as.Date(strptime(epc$Date, format = "%d/%m/%Y"))
epc0702 <- epc[epc$Date == as.Date("2007-02-01") | epc$Date == as.Date("2007-02-02"), ] 

# Adding another varialbe "CP" for combining Date and Time
epc0702$CP <- strptime(paste(epc0702$Date, epc0702$Time), format = "%Y-%m-%d %H:%M:%S", tz = "")

# Draw lines
par(mfcol = c(2,2))
# Global Active Power / Date
plot(x=epc0702$CP, y=epc0702$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatt)" )

plot(x=epc0702$CP, y=epc0702$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering" )

# Energy sub metering / Date
points(x = epc0702$CP, y = epc0702$Sub_metering_1, type = "l", col = "black")
points(x = epc0702$CP, y = epc0702$Sub_metering_2, type = "l", col = "red")
points(x = epc0702$CP, y = epc0702$Sub_metering_3, type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), bty = "n", cex = 0.7, lty=1)

# Voltage / Date
plot(x=epc0702$CP, y=epc0702$Voltage, type = "l", xlab = "datetime", ylab = "Voltage" )

# Global reactive power / Date
plot(x=epc0702$CP, y=epc0702$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


# Save to file
dev.copy(png, file = "plot4.png")
dev.off()

