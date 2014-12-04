#plot4.R
#Generates 4 line graphs - Global Active Power, Voltage Energy sub metres and Global Reactive power data between 2007-02-01 and 2007-02-02

#Read in data file and subset dates 2007-02-01 and 2007-02-02
pdata <- subset  (read.csv ("./household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), stringsAsFactors=FALSE )   , Date=="1/2/2007" | Date=="2/2/2007")

#Cast date and time columns into datetime and date types
pdata$DateTime <- strptime (paste (pdata$Date, pdata$Time, sep=" "),format ="%d/%m/%Y %T" )
pdata$Date <- as.Date(pdata$Date,format="%d/%m/%Y")

# Set alignment of 4 plots in a 2x2 matrix
par(mfrow=c(2,2))

#Plot line graph #1 - Global Active Power
plot (pdata$DateTime, pdata$Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", type="l")

#Plot line graph #2 - Voltage
plot (pdata$DateTime, pdata$Voltage, xlab="datetime", ylab = "Voltage", type="l")


#Plot line graph #3 - Sub metering
plot (pdata$DateTime, pdata$Sub_metering_1, xlab="", ylab = "Energy sub metering", type="l")
lines (pdata$DateTime, pdata$Sub_metering_2, col="red")
lines (pdata$DateTime, pdata$Sub_metering_3, col="blue")

#Add legend
legend ("topright", lty=c(1,1,1),col=c("black", "red", "blue"), bty ="n", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

#Plot line graph #4 - Global Reactive Power
plot (pdata$DateTime, pdata$Global_reactive_power, xlab="datetime", ylab = "Global_reactive_power", type="l")


#Plot to PNG file
png (file="plot4.png")

  # Set alignment of 4 plots in a 2x2 matrix
  par(mfrow=c(2,2))
  
  #Plot line graph #1 - Global Active Power
  plot (pdata$DateTime, pdata$Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", type="l")
  
  #Plot line graph #2 - Voltage
  plot (pdata$DateTime, pdata$Voltage, xlab="datetime", ylab = "Voltage", type="l")
  
  
  #Plot line graph #3 - Sub metering
  plot (pdata$DateTime, pdata$Sub_metering_1, xlab="", ylab = "Energy sub metering", type="l")
  lines (pdata$DateTime, pdata$Sub_metering_2, col="red")
  lines (pdata$DateTime, pdata$Sub_metering_3, col="blue")
  
  #Add legend
  legend ("topright", lty=c(1,1,1),col=c("black", "red", "blue"), bty ="n", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  
  #Plot line graph #4 - Global Reactive Power
  plot (pdata$DateTime, pdata$Global_reactive_power, xlab="datetime", ylab = "Global_reactive_power", type="l")
  

dev.off()
