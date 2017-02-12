# Reading data into data table
data <-read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

# Filtering data to only to 1/2/2007 and 2/2/2007
data2 <-subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

# Reformatting data
data2$Date <- as.Date(data2$Date, "%d/%m/%Y")

date_time <- paste(data2$Date, data2$Time)
date_time <- strptime(date_time, "%Y-%m-%d %H:%M:%S")
data2 <- cbind(date_time, data2)

# Plotting for Question #3
png(file = "plot3.png", width = 480, height = 480)
plot(raw2$date_time, raw2$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
lines(raw2$date_time, raw2$Sub_metering_2, col = "red")
lines(raw2$date_time, raw2$Sub_metering_3, col = "blue")
legend("topright", pch = "__________", col = c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()