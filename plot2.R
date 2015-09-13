library(dplyr)

hhdata <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE)

hhdata$Ddate <- as.Date(as.character(hhdata$Date), "%d/%m/%Y")

hhdata <- subset(hhdata, as.Date(Ddate) >= "2007-02-01" & as.Date(Ddate) <= "2007-02-02")

hhdata$GAP <- as.numeric(as.character(hhdata$Global_active_power))

hhdata$DateTime <- as.POSIXct(paste(hhdata$Date,hhdata$Time),format="%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME","English_United_States")

newtime <- strptime(paste(as.character(hhdata$Date, format="%d/%m/%Y"), as.character(hhdata$Time, format="%H:%M:%S")), format="%d/%m/%Y %H:%M:%S")

png(filename="plot2.png", width=480, height=480) 

plot(newtime, hhdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()

rm(hhdata)
