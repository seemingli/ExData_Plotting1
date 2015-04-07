## ensure Electric power consumption dataset from  UC Irvine Machine Learning Repository is in working directory
## if not, pls download from http://archive.ics.uci.edu/ml/ & unzip dataset in working directory
## use sqldf package to read some records from large csv file
library(sqldf)
fi <- file("household_power_consumption.txt")
df <- sqldf("select * from fi where Date in('1/2/2007','2/2/2007')",file.format=list(header=TRUE,sep=";"))
## good practice to close the file connection
close(fi)
## plot 2 : line graph
df$datetime<-strptime(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S")
png(file="plot2.png")
with(df,plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()