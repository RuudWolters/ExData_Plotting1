#Set the default language to English (Dutch is my native)
Sys.setenv(LANGUAGE="en")

# start script to load data-part from file if needed
source('loadPowerData.R')

# Open device
png(filename='plot4.png')

## layout 2 by 2
par(mfrow=c(2,2))

# plot in quadrant 4
plot(power.df$date.time, power.df$Global_active_power,
     ylab='Global Active Power', xlab='', type='l')

# plot in quadrant 1
plot(power.df$date.time, power.df$Voltage,
     xlab='datetime', ylab='Voltage', type='l')

# plot in quadrant 3
plot(power.df$date.time, power.df$Sub_metering_1, type='l',
     xlab='', ylab='Energy sub metering')
lines(power.df$date.time, power.df$Sub_metering_2, col='red')
lines(power.df$date.time, power.df$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid', bty='n')

# plot in quadrant 2
plot(power.df$date.time, power.df$Global_reactive_power,
     xlab='datetime', ylab='Global_reactive_power', type='l')

# Turn off device
dev.off()