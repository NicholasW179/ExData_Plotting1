library(data.table)

data <- fread('household_power_consumption.txt', na.strings = '?')
library(lubridate)

data$datetime<- paste(data$Date,data$Time)

data$datetime <- dmy_hms(data$datetime)

date1 <- as.Date('2007-02-01')
date2 <- as.Date('2007-02-03')

data2 <- data %>% filter(datetime >= date1 & datetime < date2 )

png('Plot4.png', width = 480, height = 480)
par(mfrow = c(2,2))
# Plot 1
plot(x = data2$datetime, y = data2$Global_active_power, type = 'l', 
     xlab = '', ylab = 'Global Active Power')
# Plot 2
plot(x = data2$datetime, y = data2$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')
# Plot 3
plot(x = data2$datetime,y=  data2$Sub_metering_1, type = 'l',xlab = "", ylab = 'Energy Sub Metering')
lines(x =data2$datetime, y = data2$Sub_metering_2,col = 'red')
lines(x =data2$datetime, y = data2$Sub_metering_3, col = 'blue')
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
#Plot 4
plot(x = data2$datetime, y = data2$Global_reactive_power,type = 'l',  xlab = 'datetime', ylab = 'Global_Reactive_Power')
dev.off()
