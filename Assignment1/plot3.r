#Reading only the first 100,000 lines of data. This ensures the data from relevant dates
#is read and at the same time excessive memory is not used. Home directory is set to
#where the exdata-data-household_power_consumption resides. ; is used as the separator. na string is set to ?
data<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt",nrows=100000, header=TRUE, sep=";",na.string="?")
#Converting the factor date into date data type. It uses as.Date function. A new column called
#data_date is appended in the data vector
data$data_date<-(as.Date(data$Date, format="%d/%m/%Y"))
#Using the data_date column, a data subset is created which just has the dates from 2007-02-01 to 2007-02-02
data_subset<-subset(data,data_date>=as.Date("2007-02-01") & data_date<=as.Date("2007-02-02"))
#Creating a data_subset_datetime object that both the date and time columns together
data_subset_datetime<-paste(data_subset$Date, data_subset$Time)
#Creating the datetime class using the strptime function.  
data_subset_datetime_formatted<-(strptime(data_subset_datetime, format="%d/%m/%Y %H:%M:%S"))
#Converting all the relevant parameters that need to be plotted into numeric class
data_subset_numeric_metering1<-as.numeric(data_subset$Sub_metering_1)
data_subset_numeric_metering2<-as.numeric(data_subset$Sub_metering_2)
data_subset_numeric_metering3<-as.numeric(data_subset$Sub_metering_3)
#Plotting data
plot(data_subset_datetime_formatted,data_subset_numeric_metering1,type="l", ylab="Energy Sub metering",xlab="")
#The lines function is used to add more than one line in a plot
lines(data_subset_datetime_formatted,data_subset_numeric_metering2, col="red")
lines(data_subset_datetime_formatted,data_subset_numeric_metering3, col="blue")
#Legend, the lty command essentially sets the line width of the lines in the legend
legend("topright",lty=c(1,1,1), col=c("black","red","blue"),legend=c("Sub_Metering_1","Sub_metering_2","Sub_metering_3"))
