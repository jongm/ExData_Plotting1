#Reading and preparing the data:
data=read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses="character")
data[data=="?"] <- NA
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Global_active_power <- as.numeric(data$Global_active_power)
fulldate <- paste(data$Date, "-", data$Time)
fulltime <- strptime(fulldate, "%d/%m/%Y - %H:%M:%S")

#Creating the plot:
png(file="plot2.png")
plot(fulltime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
