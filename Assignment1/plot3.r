data<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt",nrows=100000, header=TRUE, sep=";",na.string="?")
data$data_date<-(as.Date(data$Date, format="%d/%m/%Y")) 
data_subset<-subset(data,data_date>=as.Date("2007-02-01") & data_date<=as.Date("2007-02-02"))
data_subset_datetime<-paste(data_subset$Date, data_subset$Time)
data_subset_datetime_formatted<-(strptime(data_subset_datetime, format="%d/%m/%Y %H:%M:%S"))

data_subset_numeric_metering1<-as.numeric(data_subset$Sub_metering_1)
data_subset_numeric_metering2<-as.numeric(data_subset$Sub_metering_2)
data_subset_numeric_metering3<-as.numeric(data_subset$Sub_metering_3)

plot(data_subset_datetime_formatted,data_subset_numeric_metering1,type="l", ylab="Energy Sub metering",xlab="")
lines(data_subset_datetime_formatted,data_subset_numeric_metering2, col="red")
lines(data_subset_datetime_formatted,data_subset_numeric_metering3, col="blue")
legend("topright",lty=c(1,1,1), col=c("black","red","blue"),legend=c("Sub_Metering_1","Sub_metering_2","Sub_metering_3"))
