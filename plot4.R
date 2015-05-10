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
voltage <- as.numeric(subSetData$Voltage)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)

## plotting the 4 graphs
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(subSetData, {
  plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
  plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o", cex=0.75)

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
})
## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()