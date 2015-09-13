library(dplyr)

hhdata <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE)

hhdata$Ddate <- as.Date(as.character(hhdata$Date), "%d/%m/%Y")

hhdata <- subset(hhdata, as.Date(Ddate) >= "2007-02-01" & as.Date(Ddate) <= "2007-02-02")

hhdata$GAP <- as.numeric(as.character(hhdata$Global_active_power))
hhdata$SM1 <- as.numeric(as.character(hhdata$Sub_metering_1))
hhdata$SM2 <- as.numeric(as.character(hhdata$Sub_metering_2))
hhdata$SM3 <- as.numeric(as.character(hhdata$Sub_metering_3))

hhdata$DateTime <- as.POSIXct(paste(hhdata$Date,hhdata$Time),format="%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME","English_United_States")

newtime <- strptime(paste(as.character(hhdata$Date, format="%d/%m/%Y"), as.character(hhdata$Time, format="%H:%M:%S")), format="%d/%m/%Y %H:%M:%S")

png(filename="plot3.png", width=480, height=480) 

plot(newtime, hhdata$SM1, type="l", ylab="Energy sub metering", xlab="", col="black")

points(newtime, hhdata$SM2, col="red", type="l")

points(newtime, hhdata$SM3, col="blue", type="l")

legend("topright",  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red", "blue"))

dev.off()

rm(hhdata)
