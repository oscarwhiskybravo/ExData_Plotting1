rm(list=ls())
#df <- read.table("household_power_consumption.txt",header=T,na.strings="?",sep=";")
#df <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
#write.table(df,file="dataframe_filtered.txt",sep=";")

df <- read.table("dataframe_filtered.txt",header=T,sep=";")
df$datetime <- paste(df$Date,df$Time)
df$lubridate <- strptime(df$datetime,"%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1))
hist(df$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png", width=480, height=480,res=75)
dev.off()