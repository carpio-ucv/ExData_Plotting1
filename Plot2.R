#############
# PLOT 2 ####
#############

# setting directory
setwd("C:/Users/K56CA/Dropbox/Big Data/COURSERA/Exploratory Analysis")

#openning relevant libraries
library("data.table")
library("dplyr")

# Read File
total<-fread("household_power_consumption.txt", na.strings="?")


# Defining dates as class: dates
total$Date<-as.Date(total$Date, format="%d/%m/%Y")

# getting rows for filter
rows<-total$Date >= (as.Date("2007-02-01")) & 
        total$Date <= as.Date("2007-02-02")

# filtering final data set
data<-total[rows,]

#cretating a single variable with dates and time
day_time<-paste(data$Date, data$Time)
t_serie<-as.POSIXlt(day_time)

#plotting the 2 variables
plot(t_serie, data$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)", 
     cex.axis=0.75, cex.lab=0.70)

#printing graph
dev.copy(png, file="ExData_Plotting1/figure/Plot2.png", width = 480, height = 480, bg="white")
dev.off()
