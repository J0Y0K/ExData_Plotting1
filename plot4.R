#reading data
data=read.csv("household_power_consumption.txt",header=T,stringsAsFactor=F,sep=";")
#subsetting from the dates 2007-02-01 and 2007-02-02
one=data[data$Date=="1/2/2007",]
two=data[data$Date=="2/2/2007",]
onetwo=rbind(one,two)
#reformat date and time
onetwo$Date=as.Date(onetwo$Date,format="%d/%m/%Y")
onetwo$DateTime=as.POSIXct(paste(as.Date(onetwo$Date),onetwo$Time))
#construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
#2 times 2 plot
par(mfrow=c(2,2), mar=c(4,4,4,1), oma=c(0,0,0,0))
with(onetwo, {
#First plot
    plot(Global_active_power~DateTime, type="l", ylab="Global Active Power", xlab="")
#Second plot
    plot(Voltage~DateTime, type="l", ylab="Voltage", xlab="datetime")
#Third plot
    plot(Sub_metering_1~DateTime, type="l", ylab="Energy sub metering",xlab="")
    lines(Sub_metering_2~DateTime,col='Red')
    lines(Sub_metering_3~DateTime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.5)
#Last plot
    plot(Global_reactive_power~DateTime, type="l", ylab="Global_reactive_power",xlab="datetime")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

