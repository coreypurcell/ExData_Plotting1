power_stats <- read.csv2('household_power_consumption.txt', dec=".", na.strings ="?" )
stats <- subset(power_stats, Date == "1/2/2007" | Date == "2/2/2007")

stats <- within(stats, { timestamp=as.POSIXct(paste(format(strptime(Date, "%d/%m/%Y"), "%Y/%m/%d"), Time))})

png(file="plot2.png",width=480,height=540)
plot(stats$timestamp, stats$Global_active_power, type="l", axes=FALSE, ylab = "Global Active Power (kilowatts)",
     xlab="")
axis(1, labels = c("Thu", "Fri", "Sat"), at=c(as.POSIXct("2007/2/1 00:00"), as.POSIXct("2007/2/2 00:00"), as.POSIXct("2007/2/3 00:00")))
axis(2)
box()
dev.off()