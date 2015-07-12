#source the original R file with the code, that loads the data with the specified dates
#Graph the 3rd plot
source("graph_coursera.R")
data <- GetData()
if (is.data.frame(data))
{ #note: png() needs to be opened before plotting, else you get a blank screen
  png(filename= "plot3.png", width=480, height=480, bg = "transparent")
  plot(data$Time, 
       data$Sub_metering_1,
       type = "l", xlab = "", 
       ylab = "Energy sub metering")
  lines(data$Time, data$Sub_metering_2, col="red")
  lines(data$Time, data$Sub_metering_3, col="blue")
  legend("topright", col=c("black","red","blue"),legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd= 2)
  dev.off() #close this everytime so you don't have multiple devices open
  print("Plot 3 successfully graphed")
}else 
  print('data not found')
