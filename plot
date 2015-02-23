## wk01script.R
## input: reads time series for the ebola virus spread in Africa
## output: graph of ebola spread
## TODO: describe other actions

print("Welcome to 540!")

## set your working directory to whatever directory you want
# setwd("/Users/wk/Documents/RworkingDirectory")

## define the URL where the ebola data are located
# URL <- "https://raw.githubusercontent.com/cmrivers/ebola/master/country_timeseries.csv"

## define the file name on your computer where you will save the
## remote ebola data
ebolaFileName = "country_timeseries.csv" 

## copy the remote ebola data to your local computer
# download.file(URL, destfile = ebolaFileName, method="curl")

## read the ebola data and load it into a variable called 'ebola'
 ebola <- read.csv( ebolaFileName )

## show the ebola data frame in the R console
 print( ebola )

 print( class(ebola) )
 print( dim(ebola) )
 print( head(ebola) )
print( names(ebola) )

## [1] "Date"               "Day_Liberia"        "Day_SierraLeone"   
## [4] "Cases_Guinea"       "Cases_Liberia"      "Cases_SierraLeone" 
## [7] "Cases_Nigeria"      "Deaths_Guinea"      "Deaths_Liberia"    
## [10] "Deaths_SierraLeone" "Deaths_Nigeria" 

print( head(ebola[7]) )
 print( head(ebola[2]) )

print( head(ebola$Date) )
 print( head(ebola$Day_nigeria) )

 print( tail(ebola$Date) )
print( tail(ebola$Day_nigeria) )

mostRecentDate <- head(ebola$Date,1)
oldestDate <- tail(ebola$Date,1)

 print( mostRecentDate )
 print( oldestDate )

 plot( ebola$Day_nigeria, ebola$Cases_nigeria )

## plot(x, y, main="title", sub="subtitle",
##     xlab="X-axis label", ylab="y-axix label",
##     xlim=c(xmin, xmax), ylim=c(ymin, ymax)) 

country <- "nigeria"

dayCountry <- "Liberia"
casesCountry <- "Nigeria"

days  <- eval(parse(text=paste("ebola$Day", dayCountry, sep="_")))
cases <- eval(parse(text=paste("ebola$Cases", casesCountry, sep="_")))
numDays <- length(days)

mostRecentDate <- ebola$Date[1]
oldestDate <- ebola$Date[numDays]

print( mostRecentDate )
print( oldestDate )


x <- eval(parse(text=paste("ebola$Day", country, sep = "_")))
y <- eval(parse(text=paste("ebola$Cases", country, sep = "_")))

x <- ebola$Day_Nigeria
y <- ebola$Cases_Nigeria

xlabel <- paste("number of days from",oldestDate,"to",mostRecentDate,"\n")
ylabel <- "number of cases"

NATimePoints <- is.na( cases )
goodTimePoints <- ! NATimePoints

days  <- days[goodTimePoints]
cases <- cases[goodTimePoints]

print( days )
print( cases )
print( xlabel )
print( ylabel )
xlabel <- paste("number of days from",oldestDate,"to",mostRecentDate,"\n")
ylabel <- "number of cases"

xmax <- days[1]
ymax <- cases[1]

title <- paste("Spread of ebola virus in",country)
subtitle <- paste(ymax,"persons were contaminated in",xmax,"days")

plot(days, cases, main=title, sub=subtitle, xlab=xlabel, ylab=ylabel)
xmin <- 0
xmax <- x[1]

ymin <- 0
ymax <- y[1]

title <- paste("Spread of ebola virus in",country)
subtitle <- paste(ymax,"persons were contaminated in",xmax,"days")

plot(x, y, main=title, sub=subtitle, xlab=xlabel, ylab=ylabel)

#     xlim=c(xmin, xmax), ylim=c(ymin, ymax))
