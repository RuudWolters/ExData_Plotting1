library(lubridate)

#Set the default language to English (Dutch is my native)
Sys.setenv(LANGUAGE="en")

# load the textfile
if (!file.exists('powerData.rds'))
{
     power.df <- read.table("household_power_consumption.txt", header=TRUE,
                            sep=';', na.strings='?', colClasses=c(rep('character', 2), 
                            rep('numeric', 7)))
     
     # Convert dates and times
     power.df$Date <- dmy(power.df$Date)
     power.df$Time <- hms(power.df$Time)
     
     # only the data we need
     start <- ymd('2007-02-01')
     end <- ymd('2007-02-02')
     power.df <- subset(power.df, as.Date(power.df$Date, format="%d/%m/%Y") >=  '2007-02-01' 
                                  & 
                                  as.Date(power.df$Date, format="%d/%m/%Y") <= '2007-02-02')
     
     # Combine date and time
     power.df$date.time <- power.df$Date + power.df$Time
     
     # Save file
     saveRDS(power.df, file='powerData.rds')
}else
{
     power.df <- readRDS('powerData.rds')
}