#Set the default language to English (Dutch is my native)
Sys.setenv(LANGUAGE="en")

# start script to load data-part from file if needed
source('loadPowerData.R')

# Open png device
png(filename='plot2.png')

# Make the plot
plot(power.df$date.time, power.df$Global_active_power,
     ylab='Global Active Power (kilowatts)', xlab='', type='l')

# Turn off device
dev.off()