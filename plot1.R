plot1 <- function() {
	# Read the Houisehold Power Consumption Data
	powerConsumption <- read.csv("household_power_consumption.txt", sep=";", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings=c("?"), stringsAsFactors=FALSE)

	# Extract the data for 01-02-2001 and 02-02-2007
	dataForPlotting <- subset(powerConsumption, strptime(Date, format="%d/%m/%Y")==strptime("01/02/2007", format="%d/%m/%Y") | strptime(Date, format="%d/%m/%Y")==strptime("02/02/2007", format="%d/%m/%Y"))

	# Open the PNG file
	png("plot1.png")

	# Plot the Histogram
	hist(dataForPlotting$Global_active_power, breaks=12, col="Red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

	# Turn off the Graphics Device
	dev.off()
}