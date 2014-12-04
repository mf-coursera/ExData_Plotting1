#plot3.R
#Generates line graph of Energy sub metres between 2007-02-01 and 2007-02-02

#Read in data file and subset dates 2007-02-01 and 2007-02-02
pdata <- subset  (read.csv ("./household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), stringsAsFactors=FALSE )   , Date=="1/2/2007" | Date=="2/2/2007")

#Cast date and time columns into datetime and date types
pdata$DateTime <- strptime (paste (pdata$Date, pdata$Time, sep=" "),format ="%d/%m/%Y %T" )
pdata$Date <- as.Date(pdata$Date,format="%d/%m/%Y")

#Plot line graph
plot (pdata$DateTime, pdata$Sub_metering_1, xlab="", ylab = "Energy sub metering", type="l")
lines (pdata$DateTime, pdata$Sub_metering_2, col="red")
lines (pdata$DateTime, pdata$Sub_metering_3, col="blue")

#Add legend
legend ("topright", lty=c(1,1,1),col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

#Plot to PNG file
# Can not use dev.copy as it does not create an exact copy of the plot on the PNG file
png (file="plot3.png")

#Plot line graph
  plot (pdata$DateTime, pdata$Sub_metering_1, xlab="", ylab = "Energy sub metering", type="l")
  lines (pdata$DateTime, pdata$Sub_metering_2, col="red")
  lines (pdata$DateTime, pdata$Sub_metering_3, col="blue")
  
  #Add legend
  legend ("topright", lty=c(1,1,1),col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.off()
