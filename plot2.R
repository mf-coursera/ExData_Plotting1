#plot2.R
#Generates line graph of Global Active Power between 2007-02-01 and 2007-02-02

#Read in data file and subset dates 2007-02-01 and 2007-02-02
pdata <- subset  (read.csv ("./household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), stringsAsFactors=FALSE )   , Date=="1/2/2007" | Date=="2/2/2007")

#Cast date and time columns into datetime and date types
pdata$DateTime <- strptime (paste (pdata$Date, pdata$Time, sep=" "),format ="%d/%m/%Y %T" )
pdata$Date <- as.Date(pdata$Date,format="%d/%m/%Y")

#Plot line graph
plot (pdata$DateTime, pdata$Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", type="l")

#Copy to PNG file
dev.copy (png, file="plot2.png")
dev.off()
