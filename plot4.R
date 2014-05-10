data <- read.table("household_power_consumption.txt",sep = ";",header=T,colClasses=c(rep("character",2),rep("numeric",7)),na.string="?")
names(data)
head(data)

data$Date_time <-paste(data[,1],data[,2],sep=" ")
data$Date_time <- strptime(data$Date_time, "%d/%m/%Y %H:%M:%S")
data$weekdays <- weekdays(data$Date_time)

day1 <- data[(data$Date_time$year==107)& (data$Date_time$mon==1) &(data$Date_time$mday==1),]
day2 <- data[(data$Date_time$year==107)& (data$Date_time$mon==1) &(data$Date_time$mday==2),]

tday <- rbind(day1,day2)

png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(tday[,3],type="l",ylab="Global Active Power",xaxt="n",xlab="")
axis(1, at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

plot(tday[,5],type="l",ylab="Voltage",xaxt="n",xlab="datetime")
axis(1, at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

plot(tday[,7],type="l",xaxt="n",ylab="Energy sub metering",xlab="",ylim=range(tday[,7]))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),box.col="white",col=c("black","red","blue"),box.lwd=0,bg=0)
par(new=TRUE)
plot(tday[,8],type="l",xaxt="n",yaxt="n",xlab="",ylim=range(tday[,7]),ylab="",col="red")
par(new=TRUE)
plot(tday[,9],type="l",xaxt="n",yaxt="n",xlab="",ylim=range(tday[,7]),ylab="",col="blue")
axis(1, at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

plot(tday[,4],type="l",ylab="Golbal_reactive_power",xaxt="n",xlab="datetime")
axis(1, at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()