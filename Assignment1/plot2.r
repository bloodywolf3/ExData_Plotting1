#Reading only the first 100,000 lines of data. This ensures the data from relevant dates
#is read and at the same time excessive memory is not used. Home directory is set to
#where the exdata-data-household_power_consumption resides. ; is used as the separator. na string is set to ?
data<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt",nrows=100000, header=TRUE, sep=";",na.string="?")
#Converting the factor date into date data type. It uses as.Date function. A new column called
#data_date is appended in the data vector
data$data_date<-(as.Date(data$Date, format="%d/%m/%Y"))    
#Using the data_date column, a data subset is created which just has the dates from 2007-02-01 to 2007-02-02
data_subset<-subset(data,data_date>=as.Date("2007-02-01") & data_date<=as.Date("2007-02-02"))

data_subset_datetime<-paste(data_subset$Date, data_subset$Time)

data_subset_datetime_formatted<-(strptime(data_subset_datetime, format="%d/%m/%Y %H:%M:%S"))
data_subset_active_power<-as.numeric(data_subset$Global_active_power)

plot(data_subset_datetime_formatted,data_subset_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab="" )
