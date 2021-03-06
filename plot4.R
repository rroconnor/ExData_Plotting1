powerData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subDat <- subset(powerData, Date %in% c("1/2/2007", "2/2/2007"))

days <- strptime(paste(subDat$Date, subDat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(subDat$Global_active_power)
grp <- as.numeric(subDat$Global_reactive_power)
volt <- as.numeric(subDat$Voltage)
sm1 <- as.numeric(subDat$Sub_metering_1)
sm2 <- as.numeric(subDat$Sub_metering_2)
sm3 <- as.numeric(subDat$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(days, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(days, volt, type="l", xlab="datetime", ylab="Voltage")
plot(days, sm1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(days, sm2, type = "l", col = "red")
lines(days, sm3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(days, grp, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()