power_stats <- read.csv2('household_power_consumption.txt', dec=".", na.strings ="?" )
stats <- subset(power_stats, Date == "1/2/2007" | Date == "2/2/2007")
hist(stats$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylab="Frequency", col="red",  ylim=c(0,1200))
title(main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()