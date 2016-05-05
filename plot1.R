powerData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subDat <- subset(powerData, Date %in% c("1/2/2007", "2/2/2007"))

gap <- as.numeric(subDat$Global_active_power)
png("plot1.png", width=480, height=480)
hist(gap, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()