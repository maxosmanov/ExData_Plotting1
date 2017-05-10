#plot1

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
dataset$Global_active_power = as.numeric(as.character(dataset$Global_active_power))

#print the histogram in the png file
png(filename = 'plot1.png', width = 480, height = 480)
hist(dataset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()