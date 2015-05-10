dataFile <- "./household_power_consumption.txt"
completedata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## subset the data
subSetData <- completedata[completedata$Date %in% c("1/2/2007","2/2/2007") ,]
##set the date time
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)

## Plotting the active power on Y axis
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()