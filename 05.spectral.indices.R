##vegetation indices
library(terra)
library(imageRy)

im.list()

im.import("matogrosso_l5_1992219_lrg.jpg")
#this is a pre-processed satellite image of Mato Grosso, Brazil, in 1992. 1pixel=30m
#in this case bands: 1=NIR (≈vegetation), 2=red legth, 3=green legth
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
im.plotRGB(m1992, r=1, g=2, b=3)
#let's change NIR's color in green to see shadows batter
im.plotRGB(m1992, r=2, g=1, b=3)
#there are few shades of green, so the NIR reflaction is very high, consequently the vegetation is in excellent condition
#the river is purple like the land because it has many dissolved solid particles

#let's import the most recent image, from 2006
im.import("matogrosso_ast_2006209_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
im.plotRGB(m2006, r=2, g=1, b=3)
#as we can see a lot of vegetation has been destroyed since 1992 (little green, a lot purple).

#let's build a multiframe with 1992 and 2006 images, to make an easier comparison
par(mfrow=c(1,2))
im.plotRGB(m1992, r=2, g=1, b=3)
im.plotRGB(m2006, r=2, g=1, b=3)

#as we have seen, we can calculate the Different Vegetation Index, DVI = NIR - RED
DVI1992 = m1992[[1]] - m1992[[2]]
plot(DVI1992)

DVI2006 = m2006[[1]] - m2006[[2]]
plot(DVI2006)

#we can also calculate the Normalized Difference Vegetation Index, NDIV=(NIR-RED)/(NIR+RED)

#in this case the difference is normalized by dividing it by the sum of the two wavelengths
#this allows to compare results from different collections at different times or in different areas.

NDVI1992 = DVI1992/(m1992[[1]]+m1992[[2]])
NDVI2006 = DVI2006/(m2006[[1]]+m2006[[2]])

plot(NDVI1992)
plot(NDVI2006)

cl <- colorRampPalette(c("darkblue", "yellow", "red", "black")) (100)
plot(NDVI1992, col=cl)
plot(NDVI2006, col=cl)

#let's unite them
par(mfrow=c(1,2))
plot(NDVI1992, col=cl)
plot(NDVI2006, col=cl)

#specifying a new color scheme
clvir <- colorRampPalette(c("violet", "darkblue", "blue", "green", "yellow"))(100)
par(mfrow=c(1,2))
plot(NDVI1992, col=clvir)
plot(NDVI2006, col=clvir)

#speeding up calculation
#in imageRy there is already a function to calculate DVI->"im.dvi()" and NDVI-> "im.ndvi()" 
#es
ndvi2006 <- im.ndvi(m2006, 1, 2)
plot(ndvi2006a, col=cl)
