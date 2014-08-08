data<-read.table("./household_power_consumption.txt", 
               header=TRUE, sep=";", dec=".", 
               na.strings = "?") 
mydata<-subset(data, Date=="1/2/2007" | Date=="2/2/2007",
               select=Date:Sub_metering_3)
mydata$Time<-paste(mydata$Date,mydata$Time)
mydata$Time<-strptime(mydata$Time,"%d/%m/%Y %H:%M", tz="")
mydata$Date<-as.Date(mydata$Date, "%d/%m/%Y")
hist(mydata$Global_active_power, col = "green", 
     main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency")
dev.copy(png, file = "./plot1.png") 
dev.off()