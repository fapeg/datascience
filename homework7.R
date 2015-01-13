## working directory setzen
## mit hilfe von aufgaben bei rpubs!!
power_consumption <- read.csv2("household_power_consumption.txt")
power_consumption$Date <- as.Date(power_consumption$Date,format="%d/%m/%Y")
power_consumption_correct <- power_consumption[(power_consumption$Date>="2007-02-01") & (power_consumption$Date<"2007-02-03"),]
power_consumption_correct <- transform(power_consumption_correct, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
power_consumption_correct$Sub_metering_1 <- as.numeric(as.character(power_consumption_correct$Sub_metering_1))
power_consumption_correct$Sub_metering_2 <- as.numeric(as.character(power_consumption_correct$Sub_metering_2))
power_consumption_correct$Sub_metering_3 <- as.numeric(as.character(power_consumption_correct$Sub_metering_3))


## diagramm 1
hist(as.numeric(as.character(power_consumption_correct$Global_active_power)), main="Global frequency", xlab="Global Active Power (kilowatts)", col="blue")
dev.copy(png,'global_active_power_bars.png', height=480, width=480)
dev.off()

## diagramm 2
plot(power_consumption_correct$timestamp,as.numeric(as.character(power_consumption_correct$Global_active_power)), xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.copy(png,'global_active_power_plot.png', height=480, width=480)
dev.off()

## diagramm 3
plot(power_consumption_correct$timestamp,power_consumption_correct$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power_consumption_correct$timestamp,power_consumption_correct$Sub_metering_2,col="red")
lines(power_consumption_correct$timestamp,power_consumption_correct$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="energy_sub_metering.png", width=480, height=480)
dev.off()

## diagramm 4
# übernommen von webseite!
vier_diagramme <- function() {
  par(mfrow=c(2,2))
  
  ##PLOT 1
  plot(power_consumption_correct$timestamp,as.numeric(as.character(power_consumption_correct$Global_active_power)), type="l", xlab="", ylab="Global Active Power")
  ##PLOT 2
  plot(power_consumption_correct$timestamp,as.numeric(as.character(power_consumption_correct$Voltage)), type="l", xlab="datetime", ylab="Voltage")
  
  ##PLOT 3
  plot(power_consumption_correct$timestamp,power_consumption_correct$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(power_consumption_correct$timestamp,power_consumption_correct$Sub_metering_2,col="red")
  lines(power_consumption_correct$timestamp,power_consumption_correct$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
  
  #PLOT 4
  plot(power_consumption_correct$timestamp,as.numeric(as.character(power_consumption_correct$Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power")
  
  #OUTPUT
  dev.copy(png, file="vier_diagramme.png", width=480, height=480)
  dev.off()
}
vier_diagramme()
