##########################################################################
### Name: Ikrom Numonov
### Math-15900 Intro to R
### Lab #8 Global Climate Change and Regression and Importing Data
##########################################################################

########################################################################################################
### Data from https://www.ncdc.noaa.gov/cag/global/time-series/globe/land_ocean/ytd/12/1880-2020
### Go to the page above and look at the graph. We'll make a version of that
### and add a regression line.
### The data is global temperature anomolies, which is how much above or below the year was 
### with respect to the 20th century mean. Temperature is in Celsius. Multiply by 9/5 to get
### anomoly in Fahrenheit.
#########################################################################################################

## Importing data from your own csv file.
## Data from https://www.ncei.noaa.gov/access/monitoring/climate-at-a-glance/global/time-series/globe/land_ocean/1/1/1880-2022
## Dowload the Jan-1880-2022-Temp-Anomolies.csv and put it in a folder for the class.
## Change the working directory to point to the folder.

JanData<-read.csv("Jan-1880-2022-Temp-Anomolies.csv")  

head(JanData)

JanData<-read.csv("Jan-1880-2022-Temp-Anomolies.csv",skip=4)  

head(JanData)
names(JanData)
str(JanData)

plot(JanData$Year,JanData$Value)


## Import the data directly from the csv file available on the webpage.

## URL for the data
dataURL<-"https://www.ncei.noaa.gov/access/monitoring/climate-at-a-glance/global/time-series/globe/land_ocean/1/1/1880-2022/data.csv"

## skip=4 skips the first 4 lines when the data is read. The first 4 lines are meta information.
Data <-read.csv(url(dataURL),skip=4,header=TRUE)

str(Data)
head(Data)

## Here is a quick graph similar to the one on the page, but in black and white.
## Note the use of ifelse() for coloring
plot(Data$Year, Data$Value,type="h",xlab="Year", ylab="Anomoly in Deg C", lwd=4, lend=1,col=ifelse(Data$Value<0, "blue", "red"))
grid(NA,NULL,col="black")

## Let's explore the data a bit.

# What was the max anomaly and what year did it occur?
# max(Data$Value)
which.max(Data$Value) #
Data$Year[which.max(Data$Value)] #

# How many times did we exceed the average by 0.75 and what years are those?
Data[ Data$Value > 0.75, ]

# Top 10 years. First we order the data (the - makes it decreasing).
# Then use head to get the first 10 rows.

Data2<-Data[order(-Data$Value),]
head(Data2,n=10)

## Let's make a scatter plot

plot(Data$Year, Data$Value,pch=16,xlab="Year", ylab="Anomoly in Deg C",col=ifelse(Data$Value<0, "blue", "red"))
grid(NULL,NULL,col="black")

## Create a regression line and add it to the graph.

line_result <- lm(Data$Value ~ Data$Year)

## If you know linear regression as a statistical test you can read the output.
## Note the line is significant and the R-squared is good, but when we put the line on the
## graph it doesn't fit well.

summary(line_result)

## What is the slope of the line? Include the units
## This add the line to the graph.
abline(line_result, lwd=2, col="red")








########################################################################################################
### Homework
### You should write code to find the result and not just read a graph of the entire output.
##########################################################################################################

dataURL<-"https://www.ncei.noaa.gov/access/monitoring/climate-at-a-glance/global/time-series/globe/land_ocean/1/1/1880-2022/data.csv"
Data <-read.csv(url(dataURL),skip=4,header=TRUE)

### Problem 1 #############################################################################################################
### What was the min anomaly and what year did it occurr?

which.min(Data$Value) # Min anomaly: -0.71 on the 14th index;
Data$Year[which.min(Data$Value)] # Min anomaly occured in the year 1893;

### Problem 2 #############################################################################################################
### List out just the lowest 7 anomalies (they will all be negative) and their years.

Data2<-Data[order(Data$Value),]
head(Data2,n=7)

### Problem 3 #############################################################################################################
### Create a data set of just the last 23 years: 2000 through 2022. Call it Data3
### There is more than one way to do this.

Data3<-Data[ Data$Year > 1999, ]
Data3

### Problem 4 #############################################################################################################
### Make a scatter plot of the data from Problem 3

plot(Data3$Year, Data3$Value,pch=16,xlab="Year", ylab="Anomoly in Deg C",col=ifelse(Data3$Value<0, "blue", "red"))
grid(NULL,NULL,col="black")


### Problem 5 #############################################################################################################
### Find the regression line using the data from Problem 3 and add it to the graph.

line_result <- lm(Data3$Value ~ Data3$Year)
summary(line_result)
abline(line_result, lwd=2, col="red")


### Problem 6 ####################################################################################################
### What is the slope of the line from Problem 5? Include units. 


# The slope of the line is approximately 0.0205 degrees Celsius per year.


