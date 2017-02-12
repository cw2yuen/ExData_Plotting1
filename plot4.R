# Reading data into data table
data <-read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

# Filtering data to only to 1/2/2007 and 2/2/2007
data2 <-subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

# Reformatting data
data2$Date <- as.Date(data2$Date, "%d/%m/%Y")

date_time <- paste(data2$Date, data2$Time)
date_time <- strptime(date_time, "%Y-%m-%d %H:%M:%S")
data2 <- cbind(date_time, data2)

# Plotting for Question #4
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(data2, {
  plot(date_time, Global_active_power, type = "l", xlab ="", ylab = "Global Active Power")
  plot(date_time, Voltage, type = "l", xlab ="datetime", ylab = "Voltage")
  plot(data2$date_time, data2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(data2$date_time, data2$Sub_metering_2, col = "red")
  lines(data2$date_time, data2$Sub_metering_3, col = "blue")
  legend("topright", pch = "_", col = c("black","blue","red"), bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(date_time, Global_reactive_power, type = "l", xlab ="datetime", ylab = "Global_reactive_power")        
})
dev.off()