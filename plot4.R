plot4 function(){
        myFile <- "./household_power_consumption.txt"
        mySql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
        csData <- read.csv2.sql(myFile,mySql)
        
        # format date column to R's pattern
        csData[,1] <- as.Date(csData[,1], format="%d/%m/%Y")
        
        # create a list with the "timeline" of date + time
        dateTime <- strptime(paste(data$Date,data$Time), format="%Y-%m-%d %H:%M:%S")
        max_y <- max(csData[,7:9]) 
        
        # create the png file
        png("plot4.png", width = 480, height = 480)
        
        # grid to the 4 plots in order 1,1; 2,1; 1,2; 2,2
        par(mfcol=c(2,2))
        
        # create plot1 (1,1)
        plot(dateTime,csData[,3],type="l",main="",xlab="", 
             ylab = "Global Active Power")
        
        # plot2 (2,1)
        plot(dateTime,csData[,7],type="n",ylim=c(0,max_y),main="",xlab="", 
             ylab = "Energy sub metering")
        lines(dateTime,csData$Sub_metering_1)
        lines(dateTime,csData$Sub_metering_2,col="red")
        lines(dateTime,csData$Sub_metering_3,col="blue")
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               col=c("black","red","blue"),lwd=1,bty="n")
        
        # plot3 (1,2)
        plot(dateTime,csData$Voltage,type="l",main="",xlab="datetime",
             ylab="Voltage")
        
        #plot 4 (2,2)
        plot(dateTime,csData$Global_reactive_power,type="l",main="",
             xlab="datetime",ylab="Global_reactive_power")
        s
        dev.off()
}