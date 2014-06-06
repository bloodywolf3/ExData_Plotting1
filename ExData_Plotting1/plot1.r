data<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt",nrows=100000, header=TRUE, sep=";",na.string="?")
data$data_date<-(as.Date(data$Date, format="%d/%m/%Y"))    
data_subset<-subset(data,data_date>=as.Date("2007-02-01") & data_date<=as.Date("2007-02-02"), select=Global_active_power)
data_subset_numeric<-as.numeric(data_subset$Global_active_power)
hist(data_subset_numeric,20,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
              
