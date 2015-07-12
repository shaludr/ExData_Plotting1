#source the original R file (graph_coursera.R), that loads the data with the specified dates
# the dates are converted into datetime format.

source("graph_coursera.R")
data <- GetData()
if (is.data.frame(data))
{ #Graph the plot1
  png(filename= "plot1.png", width=480, height=480, bg = "transparent")
  hist(data$Global_active_power, 
       main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", 
       ylab="Frequency", col="Red")
  dev.off()
  print("Plot 1 successfully graphed")
}else 
  print('data not found')
