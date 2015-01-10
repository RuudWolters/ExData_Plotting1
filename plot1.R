# start script to load data-part from file if needed
source('loadPowerData.R')

# Open png device
png(filename='plot1.png')

# Make the plot
hist(power.df$Global_active_power, main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', col='red')

# Turn off device
dev.off()