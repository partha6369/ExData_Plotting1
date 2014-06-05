plot2 <- function() {
	# Read the Houisehold Power Consumption Data
	powerConsumption <- read.csv("household_power_consumption.txt", sep=";", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings=c("?"), stringsAsFactors=FALSE)

	# Extract the data for 01-02-2001 and 02-02-2007
	dataForPlotting <- subset(powerConsumption, strptime(Date, format="%d/%m/%Y")==strptime("01/02/2007", format="%d/%m/%Y") | strptime(Date, format="%d/%m/%Y")==strptime("02/02/2007", format="%d/%m/%Y"))

	xValues <- strptime(sprintf("%s %s", dataForPlotting$Date, dataForPlotting$Time), format="%d/%m/%Y %H:%M:%S")
	yValues <- dataForPlotting$Global_active_power
	
	# Open the PNG file
	png("plot2.png")

	# Plot the Graph
	plot(xValues, yValues, type="l", col="Black", xlab="", ylab="Global Active Power (kilowatts)")

	# Turn off the Graphics Device
	dev.off()
}