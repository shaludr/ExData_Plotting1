#This file creates a function that caches the dataset in global environment. 
#If the dataset is not available it grabs the dataset from the working directory
#for this code to work properly your text file should be in the working directory
GetData <- function()
{
  if (!exists("dataSetGlobal"))
    dataSetGlobal <<- NULL; ##if no global is defined set it null
  
  if (!is.null(dataSetGlobal) & is.list(dataSetGlobal))
  {
    return(dataSetGlobal); ##the global variable seems valid
  }
  else #else get data from file and cache it in the global variable
  {
    filename <- "house_power_consumption.txt" #change the name of the file with your filename
    new<-  read.table(filename,
                      header=TRUE,
                      sep=";",
                      colClasses=c("character", "character", rep("numeric",7)),
                      na="?")
    new$Time <- strptime(paste(new$Date, new$Time), "%d/%m/%Y %H:%M:%S")
    #subset the dataset to just use the dates jan 2 2007 to feb 2 2007
    dataSetGlobal <<- new[new$Date %in% c("1/2/2007","2/2/2007") ,]
    return(dataSetGlobal)
  }
}

