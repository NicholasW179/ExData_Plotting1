# Week 1 Capstone

library(dplyr)
library(lattice)
library(ggplot2)
library(chron)
library(data.table)
data <- fread('household_power_consumption.txt', na.strings = '?')
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
date1 <- as.Date('2007-02-01')
date2 <- as.Date('2007-02-02')
data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c('Global_active_power')]
data2 <- data %>% filter(Date >= date1 & Date <= date2 )
png('plot1.png', width = 480, height = 480)
hist(data2$Global_active_power, main = 'Global Active Power',xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency', col = 'red')
dev.off()
