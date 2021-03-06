#############
# PLOT 3 ####
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

#plotting variables
plot(t_serie, data$Sub_metering_1, type="n", xlab="",
     ylab="Energy sub metering", 
     cex.axis=0.75, cex.lab=0.70)
lines(t_serie, data$Sub_metering_1, type="S")
lines(t_serie, data$Sub_metering_2, type="S", col="red")
lines(t_serie, data$Sub_metering_3, type="S", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex=0.7, lwd= c(2,2,2), col=c("black","red","blue"))

#printing graph
dev.copy(png, file="ExData_Plotting1/figure/Plot3.png", width = 480, height = 480, bg="white")
dev.off()
