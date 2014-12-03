#Read in data file and subset dates 2007-02-01 and 2007-02-02
pdata <- subset  (read.csv ("./household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), stringsAsFactors=FALSE )   , Date=="1/2/2007" | Date=="2/2/2007")

#Cast date and time columns into datetime and date types
pdata$DateTime <- strptime (paste (pdata$Date, pdata$Time, sep=" "),format ="%d/%m/%Y %T" )
pdata$Date <- as.Date(pdata$Date,format="%d/%m/%Y")
