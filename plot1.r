library(dplyr)

hhdata <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE)

hhdata$Date <- as.Date(as.character(hhdata$Date), "%d/%m/%Y")

hhdata<-subset(hhdata, as.Date(Date) >= "2007-02-01" & as.Date(Date) <= "2007-02-02")

hhdata$Gap <- as.numeric(as.character(hhdata$Global_active_power))

png(filename="plot1.png", width=480, height=480)

hist(hhdata$Gap, col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()

rm(hhdata)
