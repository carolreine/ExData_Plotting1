plot1 function(){
        myFile <- "./household_power_consumption.txt"
        # select data only from specific dates
        mySql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
        csData <- read.csv2.sql(myFile,mySql)
        
        # create the png file
        png("plot1.png", width = 480, height = 480)
        
        # create histogram
        hist(csData[,3], main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
             ylab="Frequency",col="red")
        dev.off()
}