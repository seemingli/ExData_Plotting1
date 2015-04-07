## ensure Electric power consumption dataset from  UC Irvine Machine Learning Repository is in working directory
## if not, pls download from http://archive.ics.uci.edu/ml/ & unzip dataset in working directory
## use sqldf package to read some records from large csv file
library(sqldf)
fi <- file("household_power_consumption.txt")
df <- sqldf("select * from fi where Date in('1/2/2007','2/2/2007')",file.format=list(header=TRUE,sep=";"))
## good practice to close the file connection
close(fi)

## plot 3 : 3 line charts
df$datetime<-strptime(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S")
png(file="plot3.png")
plot(df$datetime,df$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(df$datetime,df$Sub_metering_2,type="l",col="red")
lines(df$datetime,df$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2,
       col=c("black","red","blue"),cex=0.9)
dev.off()
