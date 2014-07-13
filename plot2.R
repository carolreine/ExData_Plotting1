plot2 function(){
        myFile <- "./household_power_consumption.txt"
        # select data only from specific dates
        mySql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
        csData <- read.csv2.sql(myFile,mySql)
        
        # format date column to R's pattern
        csData[,1] <- as.Date(csData[,1], format="%d/%m/%Y")
        
        # create a list with the 'timeline' of date + time
        dateTime <- strptime(paste(data$Date,data$Time), format="%Y-%m-%d %H:%M:%S")
        
        # create the png file
        png("plot2.png", width = 480, height = 480)
        
        #creat plot without title and xlab
        plot(dateTime,csData[,3],type="l",main="",xlab="", 
             ylab = "Global Active Power (kilowatts)")
        dev.off()
}