# Exploratory Data Analysis
# Project 1
# Plot 4

# some constants
plot_name <- "plot4.png"
plot_w <- 480
plot_h <- 480
data_source_fname <- "household_power_consumption.txt"


df <- read.csv(data_source_fname, header=TRUE, nrows=100,sep=';')
classes <- sapply(df,class)
classes[1]="character"
classes[2]="character"
df<- read.csv(data_source_fname, header=TRUE,sep=';',colClasses=classes,na.strings=c("","?")) #,skip=19700,nrows=100)

df$datetime<-strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")

df.sub <- subset(df, as.Date(df$datetime) >= '2007-02-01' & as.Date(df$datetime) <= '2007-02-02')

png(filename = plot_name,width = plot_w,height = plot_h)
Sys.setlocale("LC_TIME", "English")
par(mfrow=c(2,2))

plot(df.sub$datetime,df.sub$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",main="",type='l')

plot(df.sub$datetime,df.sub$Voltage,xlab="datetime",ylab="Voltage",type='l')

plot(df.sub$datetime,df.sub$Sub_metering_1,col='black',type='l',xlab="",ylab="")
lines(df.sub$datetime,df.sub$Sub_metering_2,col='red')
lines(df.sub$datetime,df.sub$Sub_metering_3,col='blue')
title(main="",xlab="",ylab="Energy sub metering")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty='n')

plot(df.sub$datetime,df.sub$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",main="",type='l')


dev.off()
