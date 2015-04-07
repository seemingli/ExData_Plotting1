## ensure Electric power consumption dataset from  UC Irvine Machine Learning Repository is in working directory
## if not, pls download from http://archive.ics.uci.edu/ml/ & unzip dataset in working directory
## use sqldf package to read some records from large csv file
library(sqldf)
fi <- file("household_power_consumption.txt")
df <- sqldf("select * from fi where Date in('1/2/2007','2/2/2007')",file.format=list(header=TRUE,sep=";"))
## good practice to close the file connection
close(fi)
## plot 1 : histogram
png(file="plot1.png")
with(df,hist(Global_active_power,main="Global Active Power",
             col="red",xlab="Global Active Power (kilowatts)"))
dev.off()