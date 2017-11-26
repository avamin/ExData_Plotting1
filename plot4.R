##getwd()
##setwd("specify path")
##load file, treat ? values as NA
df <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
##filter data based on given dates d/m/y format
dfs <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
dfs$Date <- as.Date(dfs$Date, "%d/%m/%Y")
dfs$DateTime <- as.POSIXct(paste(dfs$Date,dfs$Time))
par(mfrow = c(2,2))
##row 1, column 1
with(dfs, plot(DateTime, Global_active_power, ylab = "Global Active Power (kilowatts)",xlab="",type="l"))
##row 1, column 2
with(dfs, plot(DateTime, Voltage, ylab = "Voltage",xlab="datetime",type="l"))
##row 2, column 1
plot(dfs$DateTime,dfs$Sub_metering_1,type = "l", ylab = "Energy Sub Metering",col = "black",xlab="") 
lines(dfs$DateTime, dfs$Sub_metering_2,type = "l",col = "red")
lines(dfs$DateTime, dfs$Sub_metering_3,type = "l",col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty = 1, lwd = 2, box.lty = 0, inset = 0.02)
##row2, column 2
with(dfs, plot(DateTime, Global_reactive_power, ylab = "Global_reactive_Power",xlab="datetime",type="l"))
##create png file
dev.copy(png, height = 480, width = 480, file = "plot4.png")
dev.off()