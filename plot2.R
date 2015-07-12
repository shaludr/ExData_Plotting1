#source the original R file with the code, that loads the data with the specified dates
#Graph plot 2

source("graph_coursera.R")
data <- GetData()
if (is.data.frame(data))
{ 
  png(filename= "plot2.png", width=480, height=480, bg = "transparent")
  plot(data$Time, 
       data$Global_active_power,
       type = "l", xlab = "", 
       ylab = "Global Active Power (kilowatts)")
  dev.off()
  print("Plot 2 graphed successfully")
}else 
  print('data not found')
