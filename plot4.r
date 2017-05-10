setwd('C:\\Users\\maks\\OneDrive\\coursera\\Data Science\\Exploratory analysis')
getwd()

Sys.setlocale("LC_ALL","English")
Sys.getlocale()
sessionInfo()

power_consumption = read.csv('household_power_consumption.txt', sep = ';', stringsAsFactors = FALSE, na.strings = "?")
power_consumption$DateFormat = as.Date(power_consumption$Date, format = "%d/%m/%Y")
dataset = subset(power_consumption, DateFormat >= as.Date("2007-02-01")& DateFormat <= as.Date("2007-02-02"))

dataset$Datetime = strptime(paste(dataset$Date, dataset$Time), format = "%d/%m/%Y %H:%M:%S")

png(filename = 'plot4.png', width = 480, height = 480)
par(mfrow=c(2,2))
plot(dataset$Datetime, dataset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(dataset$Datetime, dataset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dataset$Datetime, dataset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dataset$Datetime, dataset$Sub_metering_2, col = "red")
lines(dataset$Datetime, dataset$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)
plot(dataset$Datetime, dataset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()