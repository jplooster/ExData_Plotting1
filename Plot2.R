# with this code I assume the .txt file is in the current working directory of R (Studio)
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
temp_set <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
date <- paste(temp_set$Date, temp_set$Time)
temp_set$Date <- NULL
temp_set$Time <- NULL
date <- strptime(date, format = "%Y-%m-%d  %H:%M:%S")
sub_data <- cbind(date, temp_set)
colnames(sub_data)[1] = "Time"

png(filename = "Plot2.png", width = 480, height = 480, units = "px")
par(mar = c(5, 4, 4, 2))
plot(sub_data$Time, sub_data$Global_active_power, type = "n", xlab = "", 
     ylab = "Global Active Power (kilowatts)", cex.axis = 0.75, 
     cex.lab = 0.8, mgp = c(2, 0.5, 0))
lines(sub_data$Time, sub_data$Global_active_power)
dev.off()