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


## PLOT 4: 4 different plots
# Create PNG, 480 x 480  pixels, then plot the graphic, then save as PNG file.
# Plot 1 = old_Plot 2
# Plot 2 = old_Plot 3
# Plot 3 = Voltage x Datetime
# Plot 4 = Global_Reactive_Power x Datetime

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2, 2))

# Plot 1

plot1 <- plot(x = df$DateTime,
    y = df$Global_active_power,
    xlab = "Days of the week",
    ylab = "Global Active Power (Kilowatts)",
    type = "l")

# Plot 2
plot2 <- plot(x = df$DateTime,
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

# Plot 3

plot3 <- plot(x = df$DateTime,
            y = df$Voltage,
            xlab = "Days of the week",
            ylab = "Voltage",
            type = "l")

# Plot 4

plot4 <- plot(x = df$DateTime,
            y = df$Global_reactive_power,
            xlab = "Days of the week",
            ylab = "Global reactive power",
            type = "l")

dev.off()