df <- read.table(file = 'household_power_consumption.txt', sep = ";", header = TRUE)

df2 <- df[df$Date %in% c("1/2/2007", "2/2/2007"),]

head(df2)
str(df2)

#df2$Date <- as.Date(df2$Date, format = "%d/%m/%y")
df2$Global_active_power <- as.numeric(df2$Global_active_power)

png("plot2.png", width = 480, height = 480)
plot(df2$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
