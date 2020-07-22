df <- read.table(file = 'household_power_consumption.txt', sep = ";", header = TRUE)

df2 <- df[df$Date %in% c("1/2/2007", "2/2/2007"),]

head(df2)
str(df2)

datetime <- strptime(paste(df2$Date, df2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
df2$Global_active_power <- as.numeric(df2$Global_active_power)
df2$Sub_metering_1 <- as.numeric(df2$Sub_metering_1)
df2$Sub_metering_2 <- as.numeric(df2$Sub_metering_2)
df2$Sub_metering_3 <- as.numeric(df2$Sub_metering_3)

png("plot2.png", width = 480, height = 480)
plot(datetime, df2$Sub_metering_1, type = "l", ylab = "Energy in metering")
lines(datetime, df2$Sub_metering_2, type = "l", col = "red")
lines(datetime, df2$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()
