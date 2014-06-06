data<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt",nrows=100000, header=TRUE, sep=";",na.string="?")
data$data_date<-(as.Date(data$Date, format="%d/%m/%Y"))    
data_subset<-subset(data,data_date>=as.Date("2007-02-01") & data_date<=as.Date("2007-02-02"))
data_subset_datetime<-paste(data_subset$Date, data_subset$Time)

data_subset_datetime_formatted<-(strptime(data_subset_datetime, format="%d/%m/%Y %H:%M:%S"))
data_subset_active_power<-as.numeric(data_subset$Global_active_power)

plot(data_subset_datetime_formatted,data_subset_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab="" )
