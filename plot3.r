#plot3

#set and check working directory
setwd('C:\\Users\\maks\\OneDrive\\coursera\\Data Science\\Exploratory analysis')
getwd()

#set and check localisation (to print weekdays in English)
Sys.setlocale("LC_ALL","English")
Sys.getlocale()
sessionInfo()

#read and manipulate data
power_consumption = read.csv('household_power_consumption.txt', sep = ';', stringsAsFactors = FALSE, na.strings = "?")
dataset <- subset(power_consumption, Date == "1/2/2007" | Date == "2/2/2007") #alternatively we format Data and compare it with dates (see plot1)
dataset$Datetime <- strptime(paste(dataset$Date, dataset$Time), format = "%d/%m/%Y %H:%M:%S")

#print the plot in the png file
png(filename = "plot3.png", width = 480, height = 480)
plot(dataset$Datetime, dataset$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dataset$Datetime, dataset$Sub_metering_2, col = "red")
lines(dataset$Datetime, dataset$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)
dev.off()