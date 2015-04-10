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
with(onetwo, {    
	plot(Sub_metering_1~DateTime, type="l", ylab="Energy sub metering",xlab="")
	lines(Sub_metering_2~DateTime,col='Red')
	lines(Sub_metering_3~DateTime,col='Blue')})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
