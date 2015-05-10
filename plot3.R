dataFile <- "./household_power_consumption.txt"
completedata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## subset the data
subSetData <- completedata[completedata$Date %in% c("1/2/2007","2/2/2007") ,]

## set the date time and other variables
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

## plotting the sub metering 
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## saving the graph
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()