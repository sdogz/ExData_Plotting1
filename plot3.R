# Read partial of data
epc <- read.csv("household_power_consumption.txt", na.string = "?", sep = ";", nrows = 70000)

# subset data 2007-02-01 00:00:00 - 2007-02-02 23:59:00
epc$Date <- as.Date(strptime(epc$Date, format = "%d/%m/%Y"))
epc0702 <- epc[epc$Date == as.Date("2007-02-01") | epc$Date == as.Date("2007-02-02"), ] 

# Adding another varialbe "CP" for combining Date and Time
epc0702$CP <- strptime(paste(epc0702$Date, epc0702$Time), format = "%Y-%m-%d %H:%M:%S", tz = "")

# Draw lines
plot(x=epc0702$CP, y=epc0702$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering" )

points(x = epc0702$CP, y = epc0702$Sub_metering_1, type = "l", col = "black")
points(x = epc0702$CP, y = epc0702$Sub_metering_2, type = "l", col = "red")
points(x = epc0702$CP, y = epc0702$Sub_metering_3, type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, cex=0.7)

# Save to file
dev.copy(png, file = "plot3.png")
dev.off()