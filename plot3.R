rm(list=ls())
#df <- read.table("household_power_consumption.txt",header=T,na.strings="?",sep=";")
#df <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
#write.table(df,file="dataframe_filtered.txt",sep=";")

df <- read.table("dataframe_filtered.txt",header=T,sep=";")
df$datetime <- paste(df$Date,df$Time)
df$lubridate <- strptime(df$datetime,"%d/%m/%Y %H:%M:%S")

x <- df$lubridate
par(mfrow=c(1,1))
plot(x,df$Sub_metering_1, type="l",col="black",xlab="",ylab="Energy Sub Metering")
lines(x,df$Sub_metering_2,col="red")
lines(x,df$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.copy(png,file="plot3.png", width=480, height=480,res=75)
dev.off()