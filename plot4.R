## loading the grDevices package for rendering Graphics

library(grDevices)


## Reading House Hold data using read.table()

exdata<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt",
                   header = TRUE,sep=";",stringsAsFactors = FALSE)


## Converting type of 'Date' column to that of Date using as.Date()

exdata<-transform(exdata,Date=as.Date(Date,format="%d/%m/%Y"))


## Extracting data of Febrauary 1st, 2007 and Febrauary 2nd, 2007 using subset()

exdata<-subset(exdata,exdata$Date==as.Date("2007-02-01")|
                       exdata$Date==as.Date("2007-02-02"))


## Creating a new Column 'DateTime' by concatenating 'Date' and 'Time' columns
## paste() function is used to achieve this

exdata<-transform(exdata,DateTime=paste(exdata$Date,exdata$Time,sep = " "))

## Converting type of 'DateTime' column to Date using strptime()

exdata<-transform(exdata,DateTime=as.character(DateTime))
exdata<-transform(exdata,DateTime=strptime(DateTime,format="%Y-%m-%d %H:%M:%S"))


## Converting type of 'Sub_metering_i' columns to numeric
## If there are values with "?" corresponding to Not Available values,
## the below conversion converts them to NA with warnings
## ex:   n<-c("1","?")
##       as.numeric(n)

exdata<-transform(exdata,Sub_metering_1=as.numeric(Sub_metering_1))
exdata<-transform(exdata,Sub_metering_2=as.numeric(Sub_metering_2))
exdata<-transform(exdata,Sub_metering_3=as.numeric(Sub_metering_3))

## Converting type of 'Global_active_power' column to that of numeric type

exdata<-transform(exdata,Global_active_power=as.numeric(Global_active_power))

## Converting type of 'Global_active_power' column to that of numeric type

exdata<-transform(exdata,Voltage=as.numeric(Voltage))

## Converting type of 'Global_active_power' column to that of numeric type

exdata<-transform(exdata,Global_reactive_power=as.numeric(Global_reactive_power))



## Plotting the required graph to a png file involving below 3 steps

## 1)Open a Plotting Device (in our case a png file)

png(filename = "plot4.png",width=480,height = 480)


## 2)Plotting the graph and annotating the graph using corresponding functions

par(mar=c(5.1,5,4,2))

## Arranging the alignment of multiple plots on a device using mfrow()
par(mfrow=c(2,2))

## plot no. 1 - active power ~ datetime

plot(exdata$DateTime,exdata$Global_active_power,xlab="",
     ylab="Global Active Power",type="l")

## plot no. 2 - voltage ~ datetime

plot(exdata$DateTime,exdata$Voltage,xlab="datetime",ylab="Voltage",type="l")


## plot no. 3 - energy_sub_metering ~ datetime

plot(exdata$DateTime,exdata$Sub_metering_1,type="l",ylab="Energy sub metering",
     xlab="",col="BLACK")
points(exdata$DateTime,exdata$Sub_metering_2,type="l",col="RED")
points(exdata$DateTime,exdata$Sub_metering_3,type="l",col="BLUE")
legend("topright",lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("BLACK","RED","BLUE"),bty="n",cex=0.75)

## plot no. 4 - reactive power ~ datetime

plot(exdata$DateTime,exdata$Global_reactive_power,type="l",
     xlab="datetime",ylab="Global_reactive_power")



## 3) Closing the graphic device (our png file)

dev.off()

## The same effect can be achieved by first plotting the graph to a screen device
## and then copying it to a required graph device
## and closing this graphic device 

## The code for this is in the comments below


        ## par(mar=c(5.1,5,4,2))
        ## par(mfrow=c(2,2))

        ## plot(exdata$DateTime,exdata$Global_active_power,xlab="",
        ## ylab="Global Active Power",type="l")

        ## plot(exdata$DateTime,exdata$Voltage,xlab="datetime",ylab="Voltage",type="l")


        ## plot(exdata$DateTime,exdata$Sub_metering_1,type="l",ylab="Energy sub metering",
        ## xlab="",col="BLACK")

        ## points(exdata$DateTime,exdata$Sub_metering_2,type="l",col="RED")
        ## points(exdata$DateTime,exdata$Sub_metering_3,type="l",col="BLUE")

        ## legend("topright",lty=1,
        ## legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        ## col=c("BLACK","RED","BLUE"))

        ## plot(exdata$DateTime,exdata$Global_reactive_power,type="l",
        ## xlab="datetime",ylab="Global_reactive_power")



        ## dev.copy(png,file="plot3.png")
        ## dev.off()





