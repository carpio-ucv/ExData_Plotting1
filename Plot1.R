#############
# PLOT 1 ####
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

# transform data into numeric class
plot1<-as.numeric(data$Global_active_power)

# produce histogram
hist(plot1, col="red", xlab="Global Active Power (megawatts)", 
     ylab= "Frequency", main="Global Active Power",
     cex.axis=0.70, cex.lab=0.75)

# saving graph
dev.copy(png, file="ExData_Plotting1/figure/Plot1.png", width = 480, 
         height = 480, bg="white")
dev.off()
