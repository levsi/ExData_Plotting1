data<-read.table("./household_power_consumption.txt", 
               header=TRUE, sep=";", dec=".", 
               na.strings = "?") 
mydata<-subset(data, Date=="1/2/2007" | Date=="2/2/2007",
               select=Date:Sub_metering_3)
mydata$Time<-paste(mydata$Date,mydata$Time)
mydata$Time<-strptime(mydata$Time,"%d/%m/%Y %H:%M", tz="")
mydata$Date<-as.Date(mydata$Date, "%d/%m/%Y")

par(mfrow = c(2, 2))##, mfcol = c(1, 2))
plot(mydata$Time, mydata$Global_active_power, 
     type="l",
     ylab="Global Active Power",
     xlab="")
plot(mydata$Time, mydata$Voltage, 
     type="l",
     ylab="Voltage",
     xlab="")
plot(mydata$Time, mydata$Sub_metering_1,
     type="l",
     ylab="Energy sub metering",
     xlab="")
lines(mydata$Time, mydata$Sub_metering_2, col="red")
lines(mydata$Time, mydata$Sub_metering_3, col="blue")
legend("topright", pch = 151, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex=0.7, bty="n", y.intersp=0.5)
plot(mydata$Time, mydata$Global_reactive_power, 
     type="l",
     ylab="Global_reactive_power",
     xlab="")

dev.copy(png, file = "./plot4.png") 
dev.off()