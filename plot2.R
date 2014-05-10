data <- read.table("household_power_consumption.txt",sep = ";",header=T,colClasses=c(rep("character",2),rep("numeric",7)),na.string="?")
names(data)
head(data)

data$Date_time <-paste(data[,1],data[,2],sep=" ")
data$Date_time <- strptime(data$Date_time, "%d/%m/%Y %H:%M:%S")
data$weekdays <- weekdays(data$Date_time)

day1 <- data[(data$Date_time$year==107)& (data$Date_time$mon==1) &(data$Date_time$mday==1),]
day2 <- data[(data$Date_time$year==107)& (data$Date_time$mon==1) &(data$Date_time$mday==2),]

tday <- rbind(day1,day2)

png(filename="plot2.png",width=480,height=480)
plot(tday[,3],type="l",ylab="Global Active Power (kilowatts)",xaxt="n")
axis(1, at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()