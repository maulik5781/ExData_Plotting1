# read the table with ? as na string so we can filter later
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# remove ? (NA)
df <-na.omit(df)

# filter on interested dates Note the format is D/M/Y
df <- df[df$Date %in% c("1/2/2007", "2/2/2007"),]

# combine Date and Time so you can use in plot later as X axis
df$Date <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")

with(df, plot(Date, Global_active_power, type="l",xlab="datetime", ylab="Global Power (killowatts)"))

dev.copy(png, file = "Plot2.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!