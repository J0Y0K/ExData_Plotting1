#reading data
data=read.csv("household_power_consumption.txt",header=T,stringsAsFactor=F,sep=";")
#subsetting from the dates 2007-02-01 and 2007-02-02
one=data[data$Date=="1/2/2007",]
two=data[data$Date=="2/2/2007",]
onetwo=rbind(one,two)
#construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixel
hist(as.numeric(onetwo$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()