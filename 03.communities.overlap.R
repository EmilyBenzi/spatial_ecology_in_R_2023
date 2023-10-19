#relation among species in time
library(overlap)
# data from Kerinci-Seblat National Park in Sumatra, Indonesia (Ridout and Linkie, 2009)
data(kerinci)
head(kerinci)
# The unit of time is the day, so values range from 0 to 1. 
summary(kerinci)
#select only lines that have tiger
kerinci[kerinci$sps == "tiger", ]
summary(tiger)
tiger <- kerinci[kerinci$Sps=="tiger",]
head(kerinci)
#to obtain linear time
kerinci$Time * 2 * pi
#create a new variable with time in radiant
kerinci$timeRad <-kerinci$Time * 2 * pi
head(kerinci)
kerinci$timeRad <- kerinci$Time * 2 * pi
# selecting the first species
tiger <- kerinci[kerinci$Sps=="tiger",]
# selecting the time for the tiger
timetig <- tiger$timeRad
head(tiger)
densityPlot(timetig, rug=TRUE)
##selecting the second species
macaque <- kerinci[kerinci$Sps=="macaque", ]
# selecting the time for the macaque
timemac <- macaque$timeRad
densityPlot(timemac, rug=TRUE)
#going to overlapping the two graphs (time in which two animals are presence together)
overlapPlot(timetig, timemac)

