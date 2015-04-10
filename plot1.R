# Read partial of data
epc <- read.csv("household_power_consumption.txt", na.string = "?", sep = ";", nrows = 70000)

#dat$Date <- strptime(x$Date, format = "%d/%m/%Y")
# subset data 2007-02-01 00:00:00 - 2007-02-02 23:59:00
epc$Date <- as.Date(strptime(epc$Date, format = "%d/%m/%Y"))
epc0702 <- epc[epc$Date == as.Date("2007-02-01") | epc$Date == as.Date("2007-02-02"), ] 

#z<- strptime(paste(datt$Date, datt$Time), format = "%Y-%m-%d %H:%M:%S", tz = "")
# Draw histogram
hist(epc0702$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatt)")            

# Save to file
dev.copy(png, file = "plot1.png")
dev.off()