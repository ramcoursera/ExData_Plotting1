df <- read.csv("./data/household_power_consumption.txt", sep = ";",nrows = 3600,skip = 66000, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
df$asDate <- as.Date(df$Date, format = "%d/%m/%Y")
df <- df[df$asDate > "2007-01-31" & df$asDate < "2007-02-03",]
df$datetime <- strptime(paste(df$Date,df$Time),format = "%d/%m/%Y %T")
if(file.exists("plot3.png")) {file.remove("plot3.png")}
png(filename = "plot3.png")
plot(df$Sub_metering_1, type = "l", x = df$datetime, ylab = "Energy Sub metering", xlab = "", ylim=c(0,38))
par(new=T)
plot(df$Sub_metering_3, type = "l", x = df$datetime, ylab = "Energy Sub metering", xlab = "", ylim = c(0,38), col = "blue")
par(new = T)
plot(df$Sub_metering_2, type = "l", x = df$datetime, ylab = "Energy Sub metering", xlab = "", ylim = c(0,38), col = "red")
legend("topright", pch = "-", col = c("black","red", "blue"), legend = c("Sub_Metering_1", "Sub_Metering_2","Sub_Metering_3"), cex = 0.75, lty=c(1,1,1), lwd = 3)
dev.off()