##Time series analysis
library(imageRy)
library(terra)
#import data 
im.list()
im.import("EN_01.png")
EN01<-im.import("EN_01.png")

im.import("EN_13.png")
EN013 <- im.import("EN_13.png")


par(mfrow=c(2,1))
im.plotRGB.auto(EN01)
im.plotRGB.auto(EN013)
dif = EN01[[1]] - EN013[[1]] #difference between the first bands [1] of each image
#we created a new map that shows the difference in the first bands of each previous image (difference January March)
plot(dif)
dev.off()

#change colors
cldif <- colorRampPalette(c("blue", "white", "red")) (100)
plot(dif, col=cldif)

# now red = highest in January, blue = highest in March
#Po Valley is still high
#see Madrid very red => they dramatically stopped using engines and thus reduced emissions

#LST = land temperature

#Copernicus Global Land Service -> EU services

##Temperature in Greenland
im.list()
#greenland20... temperature's data
im.import("greenland.2000.tif")
g2000 <- im.import("greenland.2000.tif")
plot(g2000)
plot(g2000, col=cldif)
#Surface temperature (not air) in 2000.
#There is an inland area where there is ice and perennial snow, while the coastal area has higher temperatures.
#We import all the Greenland data together.
g2005 <- im.import("greenland.2005.tif")
g2010 <- im.import("greenland.2010.tif")
g2015 <- im.import("greenland.2015.tif")
plot(g2015, col=cldif)
#the most intense (+ cold) blue is shrinking
clg <- colorRampPalette(c("black", "blue", "white", "red")) (100)
plot(g2015, col=clg)

par(mfrow=c(2,1))
plot(g2015, col=clg)
plot(g2000, col=clg)
#You can see that the colder area, now black, has shrunk, indicating a large loss of ice.

#We combine the images and data from different years, thus creating several linked bands.
stackg <- c(g2000, g2005, g2010, g2015)
plot(stackg, col=clg)
#abbiamo stack tutto insime e plottato 

dev.off()

#make the difference between the first and the final elements of the stack
difg= g2000[[1]] - g2015[[1]]
plot(difg, col=cldif)
#they don't have bands so by selecting 1 I select all

difgiusto<- stackg[[1]] - stackg[[4]]
# =difgiusto <- g2000 - g2015
plot(difgiusto, col=cldif)

#make RGB plot using different years
#We can use RGB space to plot just some of that.
#So, for each image, corresponding to the temp data of different years, we associate a color for the high values.
#Where it's red, it means that the band associated with it has the highest values of all.

# im.plotRGB(stackg, red="g2000", green="g2005", blu="g2015")
im.plotRGB(stackg, r=1, g=2, b=4)
#compared temperatures between 2000 (1), 2005 (2), and 2015 (4); not 2010 (3)
#where blue/black means the highest temperatures are at the end of the temperature line => higher in 2015 than in 2000
