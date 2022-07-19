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

## PLOT 1: Global Active Power x Frequency
# Create PNG, 480 x 480  pixels, then plot the graphic, then save as PNG file.

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(df$Global_active_power,
    col = "red",
    xlab = "Global Active Power (Kilowatts)",
    main = "Global Active Power")
dev.off()