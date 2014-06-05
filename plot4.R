plot4 <- function() {
	# Read the Houisehold Power Consumption Data
	powerConsumption <- read.csv("household_power_consumption.txt", sep=";", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings=c("?"), stringsAsFactors=FALSE)

	# Extract the data for 01-02-2001 and 02-02-2007
	dataForPlotting <- subset(powerConsumption, strptime(Date, format="%d/%m/%Y")==strptime("01/02/2007", format="%d/%m/%Y") | strptime(Date, format="%d/%m/%Y")==strptime("02/02/2007", format="%d/%m/%Y"))

minimum <- min(dataForPlotting$Global_active_power)
maximum <- max(dataForPlotting$Global_active_power)

	xValues <- strptime(sprintf("%s %s", dataForPlotting$Date, dataForPlotting$Time), format="%d/%m/%Y %H:%M:%S")
	
	xRange <- range(xValues)
	yRange <- range(yValues1, yValues2, yValues3)

	# Open the PNG file
	png("plot4.png")

	# Plot the Graph
	par(mfrow = c(2, 2))
	with(dataForPlotting, {
		plot(xValues, Global_active_power, type="l", col="Black", xlab="", ylab="Global Active Power (kilowatts)")

		plot(xValues, Voltage, type="l", col="Black", xlab="datetime", ylab="Voltage")

		plot(xRange, yRange, type="n", xlab="", ylab="Energy sub metering")
		lines(xValues, dataForPlotting$Sub_metering_1, type="l", col=1)
		lines(xValues, dataForPlotting$Sub_metering_2, type="l", col=2)
		lines(xValues, dataForPlotting$Sub_metering_3, type="l", col=4)
		legend(xRange[2]-120000, yRange[2], legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c(1,2,4), lty=c(1), border=NULL)

		plot(xValues, Global_reactive_power, type="l", col="Black", xlab="datetime", ylab="Global_reactive_power")
	})
	
	# Turn off the Graphics Device
	dev.off()
}