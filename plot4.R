png(file="plot4.png",width=640,height=640)
par(mfrow = c(2, 2), mar = c(4,4,2,2), oma = c(0, 0, 0, 0))

power_stats <- read.csv2('household_power_consumption.txt', dec=".", na.strings ="?" )
stats <- subset(power_stats, Date == "1/2/2007" | Date == "2/2/2007")

stats <- within(stats, { timestamp=as.POSIXct(paste(format(strptime(Date, "%d/%m/%Y"), "%Y/%m/%d"), Time))})


plot(stats$timestamp, stats$Global_active_power, type="l", axes=FALSE, ylab = "Global Active Power (kilowatts)",
     xlab="")
axis(1, labels = c("Thu", "Fri", "Sat"), at=c(as.POSIXct("2007/2/1 00:00"), as.POSIXct("2007/2/2 00:00"), as.POSIXct("2007/2/3 00:00")))
axis(2)
box()
plot(stats$timestamp, stats$Voltage, type="l", axes=FALSE, ylab = "Voltage",
     xlab="datetime")
box()
axis(1, labels = c("Thu", "Fri", "Sat"), at=c(as.POSIXct("2007/2/1 00:00"), as.POSIXct("2007/2/2 00:00"), as.POSIXct("2007/2/3 00:00")))
axis(2)

plot(stats$timestamp, stats$Sub_metering_1, type="l", axes=FALSE, ylab = "Energy sub metering",
     xlab="")
lines(stats$timestamp, stats$Sub_metering_2, col = "red")
lines(stats$timestamp, stats$Sub_metering_3, col = "blue")
axis(1, labels = c("Thu", "Fri", "Sat"), at=c(as.POSIXct("2007/2/1 00:00"), as.POSIXct("2007/2/2 00:00"), as.POSIXct("2007/2/3 00:00")))
axis(2)
box()
legend("topright", bty="n", lty=c(1,1),col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(stats, plot(timestamp, Global_reactive_power, type="l", axes=FALSE,
     xlab="datetime"))
box()
axis(1, labels = c("Thu", "Fri", "Sat"), at=c(as.POSIXct("2007/2/1 00:00"), as.POSIXct("2007/2/2 00:00"), as.POSIXct("2007/2/3 00:00")))
axis(2)
dev.off()