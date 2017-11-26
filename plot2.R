##getwd()
##setwd("specify path")
##load file, treat ? values as NA
df <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
##filter data based on given dates d/m/y format
dfs <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
dfs$Date <- as.Date(dfs$Date, "%d/%m/%Y")
dfs$DateTime <- as.POSIXct(paste(dfs$Date,dfs$Time))
with(dfs, plot(DateTime, Global_active_power, ylab = "Global Active Power (kilowatts)",xlab="",type="l"))
dev.copy(png, height = 480, width = 480, file = "plot2.png")
dev.off()