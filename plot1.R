dataFile <- "./household_power_consumption.txt"
completedata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
completedata$Date <- as.Date(completedata$Date, format="%d/%m/%Y")
## subset the data
subSetData <- subset(completedata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Plotting the histogram for Global Active Power
GlobalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()