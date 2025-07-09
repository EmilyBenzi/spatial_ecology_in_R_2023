#measurement of RS based variability

library(imageRy)
library(terra)
library(viridis)


im.list()

sent <- im.import("sentinel.png") #Sentinel1 image of the Similau glacier
#picture 4 is a control band not used

#in this case we have:
#band1: NIR
#band2: red
#band3: green
#then we can plot it with the corresponding colors

im.plotRGB(sent, r=1, g=2, b=3)
#vegetazone green, naked rock purple, ice white

nir <- sent[[1]] #so we filtered only the NIR band

plot(nir) #now green vegetation (high NIR reflectance) and red bare soil 

#we want to calculate the standard deviation of NIR values in space
#moving window method
#this system allows you to create a "window" with a defined number of pixels.
#the standard deviation between the values of each pixel is calculated, then associating the value obtained with the central pixel of the "window"
#moving the window associates a certain standard deviation value with each pixel of the image, corresponding to a color of the defined scale

sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd) #the fz matrix represents our window
plot(sd3)

viridisc<- colorRampPalette(viridis(7)) (255)
plot(sd3, col=viridisc)
#in our image the largest standard deviations are shown in yellow.
#high deviations correspond to a greater variation in NIR values
#in blue there are instead low standard deviations, with corresponding low variations in the NIR value
#you can see that the largest standard deviation is concentrated in the top right of our image
