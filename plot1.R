#Reading and preparing the data:
data=read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses="character")
data[data=="?"] <- NA
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

#Creating the plot:
png(file="plot1.png")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
