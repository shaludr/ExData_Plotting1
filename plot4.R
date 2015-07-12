#source the originial R file with the code, that loads the data with the specified dates
#Graph all the plots in 4 panels on a same page
source("graph_coursera.R")
data <- GetData()
if (is.data.frame(data))
{ 
  
  png(filename= "plot4.png", width=480, height=480, bg = "transparent")
  #par(mfrow) will graph 4 plots on one page
  par(mfrow = c(2,2))
  
  #Graph plot 1 Top left side
 
  plot(data$Time, 
       data$Global_active_power,
       type = "l", xlab = "datetime", 
       ylab = "Global Active Power")
  
  #Graph plot 2 on Top right side
  
  plot(data$Time, 
       data$Voltage,
       type = "l", xlab = "datetime", 
       ylab = "Voltage")
  
  #Graph plot 3 on Bottom left side
 
   plot(data$Time, 
       data$Sub_metering_1,
       type = "l", xlab = "", 
       ylab = "Energy sub metering")
   
  lines(data$Time, data$Sub_metering_2, col="red")
  lines(data$Time, data$Sub_metering_3, col="blue")
  legend("topright", col=c("black","red","blue"),legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd= 2)
  #Graph plot 4 on the Bottom right side
  
  plot(data$Time, 
       data$Global_reactive_power,
       type = "l", xlab = "datetime", 
       ylab = "Global_reactive_power",
       col= "black",
       lwd=0.5)
  dev.off()
  print("Graph Successfully plotted")
}else 
  print('data not found')
