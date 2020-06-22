#Storing data from txt file to "data"

data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
	nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Plotting of interested data
plot_data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

plot_data1$Date <- as.Date(plot_data1$Date, format="%d/%m/%Y")

#Automatic saving the plot to a png file with 480x480pixel.
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

hist(plot_data1$Global_active_power, main="Global Active Power", 
	xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
