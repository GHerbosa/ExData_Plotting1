#Storing data from txt file to "data"
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
	nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Plotting the data
plot_data3 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
plot_data3$Date <- as.Date(plot_data3$Date, format="%d/%m/%Y")
dateandtime <- paste(as.Date(plot_data3$Date), plot_data3$Time)
plot_data3$Datetime <- as.POSIXct(dateandtime)

#Automatic saving the plot to a png file with 480x480pixel.
png(filename = "plot4.png", width = 480, height = 480, units = "px", ]
	pointsize = 12, bg = "white")

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(plot_data3, {
plot(Global_active_power~Datetime, type="l", 
	ylab="Global Active Power (kilowatts)", xlab="")
 
plot(Voltage~Datetime, type="l", 
	ylab="Voltage (volt)", xlab="")
plot(Sub_metering_1~Datetime, type="l", 
	ylab="Energy sub metering", xlab="")
lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
	legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
plot(Global_reactive_power~Datetime, type="l", 
	ylab="Global Reactive Power (kilowatts)",xlab="")
})

dev.off()
