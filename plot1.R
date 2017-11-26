##getwd()
##setwd("specify path")
##load file, treat ? values as NA
df <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
##filter data based on given dates d/m/y format
dfs <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
hist(dfs$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, height = 480, width = 480, file = "plot1.png")
dev.off()