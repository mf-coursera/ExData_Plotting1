#plot1.R
#Generates histogram of Global Active Power between 2007-02-01 and 2007-02-02

#Read in data file and subset data recorded between 2007-02-01 and 2007-02-02
pdata <- subset  (read.csv ("./household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), stringsAsFactors=FALSE )   , Date=="1/2/2007" | Date=="2/2/2007")

#Generate historgram
hist (pdata$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red")

#Copy to PNG file
dev.copy (png, file="plot1.png")
dev.off()
