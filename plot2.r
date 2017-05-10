#plot2

#set and check working directory
setwd('C:\\Users\\maks\\OneDrive\\coursera\\Data Science\\Exploratory analysis')
getwd()

#set and check localisation (to print weekdays in English)
Sys.setlocale("LC_ALL","English")
Sys.getlocale()
sessionInfo()

#read and manipulate data
power_consumption = read.csv('household_power_consumption.txt', sep = ';', stringsAsFactors = FALSE, na.strings = "?")
power_consumption$Date = as.Date(power_consumption$Date, format = "%d/%m/%Y")
dataset = subset(power_consumption, Date >= as.Date("2007-02-01")& Date <= as.Date("2007-02-02"))
dataset$Datetime <- as.POSIXct(paste(as.Date(dataset$Date), dataset$Time)) #alternatively dataset$Datetime = strptime(paste(dataset$Date, dataset$Time), format = "%d/%m/%Y %H:%M:%S")

#print the plot in the png file
png(filename = 'plot2.png', width = 480, height = 480)
plot(dataset$Datetime, dataset$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()


