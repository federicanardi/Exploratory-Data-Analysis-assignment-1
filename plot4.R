unzip("exdata_data_household_power_consumption.zip")
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
mysubset <- mydata[which(mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02"), ]
DataTime <- paste(mysubset$Date, mysubset$Time)
DataTime <- setNames(DataTime, "DataTime")
finalsubset <- cbind(DataTime, mysubset)
finalsubset$DataTime <- as.POSIXct(DataTime)

#PLOT 4

par(mfrow = c(2, 2))
plot(finalsubset$DataTime, finalsubset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(finalsubset$DataTime, finalsubset$Voltage, type = "l", xlab = "datetime", ylab = "Voltge")
plot(finalsubset$DataTime, finalsubset$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(finalsubset$DataTime, finalsubset$Sub_metering_2, col = "red")
lines(finalsubset$DataTime, finalsubset$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, lty = 1, bty = "n", cex = 0.5)
plot(finalsubset$DataTime, finalsubset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, filename = "plot4.png", width = 480, height = 480)
dev.off()
