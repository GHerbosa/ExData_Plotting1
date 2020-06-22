#Storing data from txt file to "data"
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Plotting the data
plot_data2 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

plot_data2$Date <- as.Date(plot_data2$Date, format="%d/%m/%Y")

datewithtime <- paste(as.Date(plot_data2$Date), plot_data1$Time)

plot_data2$Datetime <- as.POSIXct(datewithtime)

#Automatic saving the plot to a png file with 480x480pixel.

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

with(plot_data2, {
  plot(Global_active_power~Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
  })

dev.off()