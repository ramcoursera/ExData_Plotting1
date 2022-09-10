df <- read.csv("./data/household_power_consumption.txt", sep = ";",nrows = 3600,skip = 66000, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
df$asDate <- as.Date(df$Date, format = "%d/%m/%Y")
df <- df[df$asDate > "2007-01-31" & df$asDate < "2007-02-03",]
df$datetime <- strptime(paste(df$Date,df$Time),format = "%d/%m/%Y %T")
if(file.exists("plot4.png")) {file.remove("plot4.png")}
png(filename = "plot4.png")
par(mfcol = c(2,2))
with(df,{
  plot(df$Global_active_power, type = "l", x = df$datetime, ylab = "Global Active Power", xlab = "")
  plot(df$Sub_metering_1, type = "l", x = df$datetime, ylab = "Energy Sub metering", xlab = "", 
       ylim=c(0,38))
  par(new=T)
  plot(df$Sub_metering_3, type = "l", x = df$datetime, ylab = "Energy Sub metering", 
        xlab = "", ylim = c(0,38), col = "blue")
  par(new = T)
  plot(df$Sub_metering_2, type = "l", x = df$datetime, ylab = "Energy Sub metering", xlab = "", 
       ylim = c(0,38), col = "red")
  legend("topright", inset = .01,
         col = c("black", "red", "blue"), 
         lty = c(1,1,1), lwd = 2,
         cex=.65, bty="n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  )
  plot(df$Voltage, type = "l", x = df$datetime, ylab = "Voltage", xlab = "datetime")
  plot(df$Global_reactive_power, type = "l", x = df$datetime, ylab = "Global_reactive_power", xlab = "datetime")
})
par(mfcol = c(1,1))
dev.off()