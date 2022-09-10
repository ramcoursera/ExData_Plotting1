# src dataset: https://archive.ics.uci.edu/ml/datasets/individual+household+electric+power+consumption

df <- read.csv("./data/household_power_consumption.txt", sep = ";",nrows = 3600,skip = 66000, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
df$asDate <- as.Date(df$Date, format = "%d/%m/%Y")
df <- df[df$asDate > "2007-01-31" & df$asDate < "2007-02-03",]
if(file.exists("plot1.png")) {file.remove("plot1.png")}
png(filename = "plot1.png")
hist(df$Global_active_power, main = "Global Active Power",xlab = "Global Active Power (kilowatts)" )
dev.off()