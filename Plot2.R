library(data.table)

data <- fread('household_power_consumption.txt', na.strings = '?')
library(lubridate)

data$datetime<- paste(data$Date,data$Time)

data$datetime <- dmy_hms(data$datetime)

date1 <- as.Date('2007-02-01')
date2 <- as.Date('2007-02-03')

data2 <- data %>% filter(datetime >= date1 & datetime <= date2 )
png('Plot2.png', width = 480, height = 480)
plot(x = data2$datetime, y = data2$Global_active_power, 
     type = 'l', xlab = '', ylab = 'Global Active Power (Kilowatts)')
dev.off()

