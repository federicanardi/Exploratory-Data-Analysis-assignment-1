
unzip("exdata_data_household_power_consumption.zip")
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
mysubset <- mydata[which(mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02"), ]
DataTime <- paste(mysubset$Date, mysubset$Time)
DataTime <- setNames(DataTime, "DataTime")
finalsubset <- cbind(DataTime, mysubset)
finalsubset$DataTime <- as.POSIXct(DataTime)


#PLOT1

hist(mysubset$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
dev.copy(png, filename = "plot1.png", width = 480, height = 480)
dev.off()