#Storing data from txt file to "data" and since the concern is only on
#2007-02-01 and 2007-02-02, it is better to skip some lines and limit
#the information to be loaded in this particular case.

data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
	nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

plot_data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

plot_data1$Date <- as.Date(plot_data1$Date, format="%d/%m/%Y")

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"), symbolfamily="default")

hist(plot_data1$Global_active_power, main="Global Active Power", 
	xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
