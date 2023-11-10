#remotesensing.data.visualisation  
library(imageRy)
library(terra)
im.list()
b2 <- im.import("sentinel.dolomites.b2.tif")
b3 <- im.import("sentinel.dolomites.b3.tif")
b4 <- im.import("sentinel.dolomites.b4.tif")
b8 <- im.import("sentinel.dolomites.b8.tif")
stacksent <- c(b2,b3,b4,b8)
plot(stacksent)
#blue wavelegth, b2 [1]
#green wavelegth, b3 [2]
#red wavelegth, b4 [3]
#IR wavelegth, b8 [4]

im.plotRGB(stacksent, r=3, g=2, b=1)
#RGB is a method that associates three ranges of values with the colors red, green and blue. 
#in our case the satellite images are reported as refraction of the blue (b2), green (b3), red (b4) and infrared (b8) wavelengths.
#with the "im.implotRGB()" function we associate the data we want with the RGB colors.
#above we have made them correspond to the real corresponding colors, obtainign the real satellite image.

#as we can see, the element in position 4 in stacksent, band 8 (b8), is not represent, because RGB have only 3 value
#b8, infrared reflectance, is however very important in vegetation investigations.
#plants in fact reflect the IR a lot and absorb the lengths of red (b4) for photosynthesis.
#starting from this knowledge, it is possible to establish, in addition to the distribution of vegetation, also their state of "health
#in fact, the lower the reflectance of the red (greater absorption) and the greater that of the IR (less absorption), the better the "health" of the vegetation considered will be.
#so let's use the b8 values to
im.plotRGB(stacksent, r=4, g=3, b=2)
#in this way everything that is red indicates vegetation. specifically dark red=woods, light red=pastures
im.plotRGB(stacksent, r=3, g=4, b=2)
#in this way everything that is green indicates vegetation.

#function pairs() produce a matrix of scatterlplots, where we can check the correlation between bands
pairs(stacksent)
#The bar graphs in the center show the reclactance frequency for each wavelength
#the values (integer) above the graphs report the correlation (in pairs) between the various bands (=Pearson coefficient)
#the last ones are scatter plots, which show the relationship between the band variables (in pairs)
#it is possible to notice in the latter that all the values of the bands in the visible are correlated with each other (linear).
#the correlation between the values in the IR with those in the three visible bands is instead lower

#it is also possible to construct an index associated with the health of the vegetation under analysis
#as already said, the reflactance in the NIR is directly proportional to the health of the vegetation
#on the contrary, the reflactance in the red (b4) is inversely proportional to the health of the vegetation
#Different Vegetation Index, DVI (high values=healthy vegetation; low values=unhealthy vegetation)
#DVI=NIR-RED
#it can also be used for monitoring data over time
