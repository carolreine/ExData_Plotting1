plot3 function(){
        myFile <- "./household_power_consumption.txt"
        # select data only from specific dates
        mySql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
        csData <- read.csv2.sql(myFile,mySql)
        
        # format date column to R's pattern
        csData[,1] <- as.Date(csData[,1], format="%d/%m/%Y")
        # create a list with the "timeline" of date + time
        dateTime <- strptime(paste(data$Date,data$Time), format="%Y-%m-%d %H:%M:%S")
        
        # create the png file
        png("plot3.png", width = 480, height = 480)
        
        # max number from sub metering 1/2/3
        max_y <- max(csData[,7:9]) 
        
        # creat plot with using the max value for y, with no title
        plot(dateTime,csData[,7],type="n",ylim=c(0,max_y),main="",xlab="", 
             ylab = "Energy sub metering")
        lines(dateTime,csData$Sub_metering_1)
        lines(dateTime,csData$Sub_metering_2,col="red")
        lines(dateTime,csData$Sub_metering_3,col="blue")
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               col=c("black","red","blue"),lwd=1)
        dev.off()
}
