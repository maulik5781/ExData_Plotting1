# read the table with ? as na string so we can filter later
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# remove ? (NA)
df <-na.omit(df)

# filter on interested dates Note the format is D/M/Y
df <- df[df$Date %in% c("1/2/2007", "2/2/2007"),]

# combine Date and Time so you can use in plot later as X axis
df$Date <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")

plot(df$Date, df$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "datetime")
lines(df$Date, df$Sub_metering_2, type = "l", col = "red")
lines(df$Date, df$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = .75, cex = .75, col = c("black", "blue", "red"),legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

dev.copy(png, file = "Plot3.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!