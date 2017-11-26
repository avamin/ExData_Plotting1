##getwd()
##setwd("specify path")
##load file, treat ? values as NA
df <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
##filter data based on given dates d/m/y format
dfs <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
dfs$Date <- as.Date(dfs$Date, "%d/%m/%Y")
dfs$DateTime <- as.POSIXct(paste(dfs$Date,dfs$Time))
plot(dfs$DateTime,dfs$Sub_metering_1,type = "l", ylab = "Energy Sub Metering",col = "black",xlab="") 
lines(dfs$DateTime, dfs$Sub_metering_2,type = "l",col = "red")
lines(dfs$DateTime, dfs$Sub_metering_3,type = "l",col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty = 1, lwd = 2)
dev.copy(png, height = 480, width = 480, file = "plot3.png")
dev.off()