#RS data

install.packages("devtools")
library(devtools)
#funtion "instal_gitub" allows to install packages from gitub
install_github("ducciorocchini/imageRy") #from the devtools
library(imageRy)
library(terra)

#list the data
im.list()
#function "im.import" allows to import any image
b2 <- im.import("sentinel.dolomites.b2.tif")
b2
#coord.ref WGS 84 is the ellipsoide di riferimento

####NON FUNZIONA############
#UTM zone 32 perchè siamo nel meridiano numero 32
#let's change colors with function coloRamPalette("name of color1","name of color2",...)
clb <- colorRampPalette(c("darkgrey", "grey", "lightgrey"))
plot(b2, col=clb)

#import the green band from Sentinel-2 (band 3) and change colors
