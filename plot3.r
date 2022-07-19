library(lubridate)

## Read Data Set 
df <-  read.delim(file = "household_power_consumption.txt",
 header = TRUE,
 sep = ";",
 dec = ".",
 na.strings = "?",
 colClasses = c(NA, NA, rep ("numeric", 7)))

 # Convert "Date" column to Date Class
df$Date <- as.Date(df$Date, "%e/%m/%Y")

# Convert "Time" column to Date Class
df$Time <- format(strptime(df$Time, "%H:%M:%S"),"%H:%M:%S")

# Subset Date to chosen time: 2007-02-01 and 2007-02-02
df <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02", ]

# Used variable: date+time together
try <- paste(df$Date, df$Time)
df$DateTime <- ymd_hms(try)

## PLOT 3: Energy submetering
# Create PNG, 480 x 480  pixels, then plot the graphic, then save as PNG file.
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot.new()
plot(x = df$DateTime,
     y = df$Sub_metering_1,
    xlab = "Days of the week",
    ylab = "Energy submetering",
    type = "l",
    )
lines(x = df$DateTime, y1 <- df$Sub_metering_2,  type = "l", col = "red")
lines(x = df$DateTime, y2 <- df$Sub_metering_3,  type = "l", col = "blue")

legend("topright", legend = 
      c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
      col = c("black", "red", "blue"),
      pch = 1)

dev.off()