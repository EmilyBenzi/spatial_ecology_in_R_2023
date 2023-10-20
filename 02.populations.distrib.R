##population density and distribution
install.packages("sdm")
install.packages("terra")
install.packages("rgdal")
library(sdm)
#for spatial function
library(terra)
library(rgdal)
library(spatstat)
#why population disperse over the landscape in a certain manner?
install.packages("external/species.shp")
#create a variable called file, where is saved the pathway to enter in the file
file <- system.file("external/species.shp", package="sdm")
#famous file extension
system.file("external/species.shp", package="sdm")
#sdm is a folder inside external.folder

#rana temporaria
rana <- vect(file)
rana
#for searching inside the file that we nominated "rana" the dataset "Occurrence"?
rana$Occurrence
#these are code of presences and absences (non importa quanti ma solo se ci sono, altrimenti sarebbe abboundance)
plot(rana)
plot(rana, cex=0.5)

#want to select only the presences, so only the 1's in sections rana$Occurrence
rana[rana$Occurrence==1,]
pres <- rana[rana$Occurrence==1,]
pres$Occurrence
#plot only presences
plot(pres, cex=0.5)

#exercise: select only absences 
abse <- rana [rana$Occurrence==0]
abse
plot(abse, cex=0.5)
#or you can use different from 1, so different prome presences
abse1 <- rana[rana$Occurrence!=1]
abse1
plot(abse1, cex=0.5)

#ex2 plot presences and absences one beside the other (function "par" "mfraw", multi frame row)
#nb you have to run the following three line together 
par(mfrow=c(1,2))
plot(pres, cex=0.5)
plot(abse)
# dev.off() to close all plot (also in case of graphical problem)
dev.off()

#ex3: plot pres and abse altogether with two different colours
plot(pres, col="dark blue")
plot(abse, col="light blue")
#in this way I changed the color of the points of each graph, but they are separated into two graphs
#to join them in a graph launch one of the two with a color and then the other using the points() function
plot(pres, col="dark blue")
#and then launch the following one
points(abse, col="light blue")

#predictors: environmental variables (.asc)
#funcion raast() rusters (images)
elev <- system.file("external/elevation.asc", package="sdm")
#obtain the pathway for the elevation file
elev
elevmap <- rast(elev) #from terra package
elevmap
#plot the elevmap
plot(elevmap)
#add where rana is presence in the elevation map
points(pres, cex=0.5)
#we can see the distribution of rana => principalmente tra 500-1000, con temperature medie, non a basse ed alte altitudini

#temperature predictor
temp <- system.file("external/temperature.asc", package="sdm")
tempmap <- rast(temp) #from terra package
plot(tempmap)
points(pres, cex=0.5)
#=> rana avoid lower temperature

#exercise3: do the same with vegetation cover
veg <- system.file("external/vegetation.asc", package="sdm")
vegmap<- rast(veg)
plot(vegmap)
points(pres, cex=.5)
#=> rana going to prefer places where there is a high vegetation cover (to avoid predators)

#do the same with precipitation distribution
prec <- system.file("external/precipitation.asc", package="sdm")
precmap<- rast(prec)
plot(precmap)
points(pres, cex=.5)
#rana prefer high precipitation area

#ex4: final multiframe: plot everything together

par(mfrow=c(2,2))

#elevation
plot(elevmap)
points(pres, cex=0.5)

#temperature
plot(tempmap)
points(pres, cex=0.5)

#vegetation
plot(vegmap)
points(pres, cex=.5)

#precipitation
plot(precmap)
points(pres, cex=.5)

#select all and run it
