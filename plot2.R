# Reading data into data table
data <-read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

# Filtering data to only to 1/2/2007 and 2/2/2007
data2 <-subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

# Reformatting data
data2$Date <- as.Date(data2$Date, "%d/%m/%Y")

date_time <- paste(data2$Date, data2$Time)
date_time <- strptime(date_time, "%Y-%m-%d %H:%M:%S")
data2 <- cbind(date_time, data2)

# Plotting for Question #2
png(file = "plot2.png", width = 480, height = 480)

plot(data2$date_time, data2$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)", col="black")

dev.off()