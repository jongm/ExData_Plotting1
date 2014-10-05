#Reading and preparing the data:
data=read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses="character")
data[data=="?"] <- NA
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
fulldate <- paste(data$Date, "-", data$Time)
fulltime <- strptime(fulldate, "%d/%m/%Y - %H:%M:%S")

#Creating the plot:
png(file="plot3.png")
plot(fulltime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(fulltime, data$Sub_metering_2, col="red")
lines(fulltime, data$Sub_metering_3, col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), cex=0.8, legend = c("Sub_metering_1", "Sub_metering_1", "Sub_metering_3"))
dev.off()
