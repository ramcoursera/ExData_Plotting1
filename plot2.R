df <- read.csv("./data/household_power_consumption.txt", sep = ";",nrows = 3600,skip = 66000, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
df$asDate <- as.Date(df$Date, format = "%d/%m/%Y")
df <- df[df$asDate > "2007-01-31" & df$asDate < "2007-02-03",]
df$datetime <- strptime(paste(df$Date,df$Time),format = "%d/%m/%Y %T")
if(file.exists("plot2.png")) {file.remove("plot2.png")}
png(filename = "plot2.png")
plot(df$Global_active_power, type = "l", x = df$datetime, ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()