##external data

library(terra)
#remeber: searching packages on internet you can check its functions, what them do, ecc.

#NASA's earth systems observatory
#ESA europian spacial agency

#Earth observatory -> processed data
#Sentinel 2 (10m spatial resolution) ->ESA
#landsat (30m spatial resolution) NASA
#Modis (different spatial resolution, >500m) NASA
#Copernicus (in which Sentinel 2) ESA

#NASA earth observatory
#changing in Najaf lake between 2003 and 2023
#download the first image of Najaf
#image 20/05/2003

#set the working directory with the function: setwd("path") [or print workin directory pwd("...") <- non la trovo] 
#path = copy and paste what is in "situato in" about details of the considered dataset in our computer
#NB: with "\" the path doesn't work, use "/"
setwd("/Users/emilybenzi/Desktop/spatial ecology")
#no error = we are in the working directory

#import the downloaded image
rast("najafiraq_etm_2003140_lrg.jpg") #like im.import() on package imageRy
#the argument is the complete name of the saved image, find it in "dettagli immagine"

#give a new name to the image to manage it easier on R 
naja <- rast("najafiraq_etm_2003140_lrg.jpg")

#plot the image
plotRGB(naja) #this function is like im.plotRGB we used on the imageRy pack


#download the second image from August (7/08/2023)
#it's not necessary to set the working directory again, it's still the previous one
#it must be done only when the work session changes (as for "library")

#import the second image
rast("najafiraq_oli_2023219_lrg.jpg")
naja2 <- rast("najafiraq_oli_2023219_lrg.jpg")

#plot the image
plotRGB(rast("najafiraq_oli_2023219_lrg.jpg"))

#plot the images together to compare them
par(mfrow=c(2,1))
plotRGB(naja)
plotRGB(naja2)

dev.off()

#multi-temporal change detection
#let's check the differences
najadif= naja[[1]]-naja2[[1]]
cl1 <- colorRampPalette(c("brown" , "grey" , "orange")) (100)

plot(najadif, col=cl1)
