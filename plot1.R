# Exploratory Data Analysis
# Project 1
# Plot 1

# some constants
plot_name <- "plot1.png"
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
hist(df.sub$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col='red')
dev.off()