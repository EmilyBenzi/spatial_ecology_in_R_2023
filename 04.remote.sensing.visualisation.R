##RS data
install.packages("devtools")
library(devtools)
#funtion "instal_gitub()" allows to install packages from gitub
install_github("ducciorocchini/imageRy") #from the devtools
library(imageRy)
library(terra)

#function im.list() of the dataset imageRy, allows to to obtain a list of all data 
im.list()

#function "im.import" allows to import any image
#function im.import() allows to import a chosen image stored in the imageRy package
im.import("sentinel.dolomites.b2.tif")
#this data, which corresponds to the satellite image, report the blue wavelengths

#Let's give the image a name
b2 <- im.import("sentinel.dolomites.b2.tif")
b2
#coord.ref WGS 84 is the reference ellipsoid
#UTM zone 32 perchè siamo nel meridiano numero 32
#UTM zone 32 indicates the meridian we are referring to

#in this dataset are present a set of four bands of a Sentinel-2 image provided over the area of Tofane, Dolomites
#blue band
b2
#green band
b3 <- im.import("sentinel.dolomites.b3.tif")
b3
#red band
b4 <- im.import("sentinel.dolomites.b4.tif")
b4
#NIR band
b8 <- im.import("sentinel.dolomites.b8.tif")
b8

#let's change colors with function coloRamPalette("name of color1","name of color2",...)
#function coloRampPalette() returns functions that interpolate a set of given colors to create new color palettes
clb <- colorRampPalette(c("darkgrey", "grey", "lightgrey")) (100)
#100 is the amount of colors in the gradient

#now let's apply these to our image, and plot it
plot(b2, col = clb)

#let's create a new variable with other colors
cl <- colorRampPalette(c("black", "grey", "lightgrey")) (100)

par(mfrow=c(2,2)) #can be used to set or query graphical parameters
plot(b2)
plot(b3)
plot(b4)
plot(b8)

#let's put new colors in the images and plot them
par(mfrow=c(2,2)) 
plot(b2, col=cl)
plot(b3, col=cl)
plot(b4, col=cl)
plot(b8, col=cl)

#we merge the images/data into one variable to work faster
stacksent <- c(b2,b3,b4,b8)

dev.off() #allows to close device

plot(stacksent)

#now it's easier to edit all data at the same time
plot(stacksent, col=cl)

# Exercise: plot in a multiframe the bands with different color ramps

clgr <- colorRampPalette(c("darkgreen","green","lightgreen")) (100)
plot(stacksent, col=clgr)
plot(stacksent[[4]], col=clgr)

clo <- colorRampPalette(c("darkorange", "orange", "yellow")) (100)
plot(stacksent, col=clo)

cly <- colorRampPalette(c("blue", "yellow", "red")) (100)
plot(stacksent, col=cly)
plot(b2, col=cly)

clp <- colorRampPalette(c("white", "pink", "purple")) (100)
plot(stacksent, col=clp)

# so stacksent is made up by: 
# band2 blue element 1, stacksent[[1]] 
# band3 green element 2, stacksent[[2]]
# band4 red element 3, stacksent[[3]]
# band8 nir element 4, stacksent[[4]]
#if we want to work with only one of the data we can also "filter" it from this variable, indicating its position
plot(stacksent[[4]], col=clp)
