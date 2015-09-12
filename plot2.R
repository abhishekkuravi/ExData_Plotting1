#Set Working Directory
setwd("C:/Users/usakuravi/Desktop/ST/Data Science Training/Coursera/Exploratory Data Analysis/Course Projects/Project 1")

#Get header of data
sample <- read.table("household_power_consumption.txt", sep = ";", nrows = 10, header = T )
header = names(sample)

#Read file with just two days data, attach header from above
project1 <- read.csv("household_power_consumption.txt", sep = ";", skip = 66637, na.strings = "?", nrows = 2880, header = F, stringsAsFactors = F)
names(project1) <- header
project1$Date <- as.Date(project1$Date, format = "%d/%m/%Y")
project1$timedate <- paste(project1$Date, project1$Time, sep = " ")
project1$Time <- strptime(project1$timedate, format = "%Y-%m-%d %H:%M:%S")

#Plot second graph "plot2" and save to png
png(file = "plot2.png", width= 480, height = 480)
plot(x = project1$Time, y = project1$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
lines(project1$Time,project1$Global_active_power)
dev.off()
