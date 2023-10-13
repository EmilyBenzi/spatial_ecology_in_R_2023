install.packages("sdm")
install.packages("terra")
install.packages("rgdal")
library(sdm)
#for spatial function
library(terra)
library(rgdal)
library(spatstat)
#why population disperse over the landscape in a certain manner?

#create a variable called file where is saved the pathway to enter in the file
file <- system.file("external/species.shp", package="sdm") 
#famouse extention of file
system.file("external/species.shp", package="sdm")
#sdm is a folder inside external.folder
#rana temporaria
rana <- vect(file)
rana

#for searching inside the file that we nominated "rana" the dataset "Occurrence"?
rana$Occurrence
plot(rana)
plot(rana, cex=0.5)

#want to select only the presences, so only the 1 in sections rana$Occurrence
rana[rana$Occurrence==1,]
pres <- rana[rana$Occurrence==1,]
pres$Occurrence

#plot only presences
plot(pres, cex=0.5)
#exercise: select only absences and plot them

abse <- rana [rana$Occurrence==0]
abse
plot(abse, cex=0.5)
##or you can use different from 1, so different prome presences
abse1 <- rana[rana$Occurrence!=1]
abse1
plot(abse1, cex=0.5)
#ex2 plot presences and absences one beside the other
par(mfrow=c(1,2))
plot(pres)
plot(abse)
# dev.off() to close all plot (also in case of graphical problem)
dev.off()

#ex2: plot pres and abse altogether with two different colours
plot(pres, col="dark blue")
plot(abse, col="light blue")
#in questo modo ho modificato il colore dei punti di ogni grafico, ma sono separati in due grafici
#per unirli in un grafico lanciare preima uno dei due con un colore e poi l'altro usando la funzione points()
plot(pres, col="dark blue")
#e lanciare, poi lanciare la seguente
points(abse, col="light blue")

#predictors: environmental variables (.asc)
#funcion raast() rusters (images)
elev <- system.file("external/elevation.asc", package="sdm")
#obtain the pathway for the elevation file
elev
#
elevmap <- rast(elev)
elevmap
#plot the elevmap
plot(elevmap)
#add where rana is presence in the elevation map
points(pres, cex=0.5)
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

#ex4: funal multiframe, plot everything together

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
