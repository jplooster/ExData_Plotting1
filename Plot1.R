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

png(filename = "Plot1.png", width = 480, height = 480, units = "px")
par(mar = c(5, 4, 4, 2))
hist(sub_data$Global_active_power, breaks = 12, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red", 
     cex.axis = 0.75, cex.lab = 0.75, cex.main = 0.75, mgp = c(2, 1, 0))
dev.off()
