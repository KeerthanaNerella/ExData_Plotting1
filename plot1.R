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


## Converting type of 'Global_active_power' column to that of numeric type
## If there are values with "?" corresponding to Not Available values,
## the below conversion converts them to NA with warnings
## ex:   n<-c("1","?")
##       as.numeric(n)

exdata<-transform(exdata,Global_active_power=as.numeric(Global_active_power))


## Plotting the required graph to a png file involving below 3 steps

## 1)Open a Plotting Device (in our case a png file)

png(filename = "plot1.png",width=480,height = 480)

## 2)Plotting the graph and annotating the graph using correspondin functions

par(mar=c(5.1,5,4,2))

hist(exdata$Global_active_power,col="RED",
     xlab="Global Active Power (kilowatts)",ylab="Frequency",
     main="Global Active Power")

## 3) Closing the graphic device (our png file)

dev.off()

## The same effect can be achieved by first plotting the graph to a screen device
## and then copying it to a required graph device
## and closing this graphic device 
## The code for this is in the comments below

        ## hist(exdata$Global_active_power,col="RED",
        ## xlab="Global Active Power (kilowatts)",ylab="Frequency",
        ## main="Global Active Power")

        ## dev.copy(png,file="plot1.png")

        ## dev.off()

