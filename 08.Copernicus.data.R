##Copernicus data_SSM

install.packages("ncdf4")
library(ncdf4)
library(terra)

#https://land.copernicus.vgt.vito.be/PDF/portal/Application.html

#the images in the Copernicus project are collected by satellites, called sentinels.
#these are of six types, each of which collects data on different terrestrial physical parameters.
#the images we will work with later are satae collected by Sentinel1
#Seninel1 is a satellite equipped with an active sensor that sends signals to the earth and analyzes their return
#in this way it is able to map continuously, regardless of the moment of the day or the weather conditions.
#At each step Sentinel1 maps a "band" of land, which then combined provides complete information over time
#there are actually 2 Sentinel1s moving at opposite poles of the same orbit, in this way or at each step a double comparison of the data is possible.
#these satellites complete one rotation around the Earth in 97 minutes, so the revisit time is 6 days (= maps the entire globe every 6 days)


#download the images of interest
#[Copernicus global land service < vegetation < surface soil moisture < product portal < search < download the product on November 25th < Data Files]
#dataset of interest: Surface Soil Moisture (SSM) 
#is the relative water content of the top few centimeters soil, describing how wet or dry the soil is in its top-most layer
#it's expressed in percent saturation.
#It is measured by Sentinel1 and allows insights in local precipitation impacts and soil conditions.

#set the working directory
setwd("/Users/emilybenzi/Desktop/spatial ecology")

#import the datas
soilm2023 <- rast("c_gls_SSM1km_202311250000_CEURO_S1CSAR_V1.2.1.nc")
soilm2023
plot(soilm2023) #one is the real image of soil moisture, the other is its noise, so the amount of error

#select only the fisrt image
soilm2023[[1]]
plot(soilm2023[[1]])

#change colores
cl <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(soilm2023[[1]], col=cl)

#make a crop of the image

#the extension reports the minimum and maximum values of longitude and latitude (you can also see them in the image)
#specifically
#minimum longitude= -11
#maximum longitude= 50
#minimum latitude= 35
#maximum latitude= 72

#therefore the "zoom" will have to be carried out within these ranges
extp <- c(22, 26, 55, 57) #the numbers are the new values of #minlong #maxlong #minlat #maxlat
#in this way, even by downloading another image, you will be able to select the same coordinates
#it is therefore possible to compare the same point with different variables or at different times

#let's create the new object "zoomed" compared to the original
soilm2023c <- crop(soilm2023, extp)
plot(soilm2023c, col=cl)

#also in this case we have the 2 images and we select only the first
plot(soilm2023c[[1]], col=cl)


#download a new image of SSM dated 24/11/23 (same w.d.)
soilm2023_2 <- rast("c_gls_SSM1km_202311240000_CEURO_S1CSAR_V1.2.1.nc")
soilm2023_2
plot(soilm2023c[[1]])
plot(soilm2023_2[[1]], col=cl)
soilm2023_2c <- crop(soilm2023_2, extp) #"zoom" to the same coordinates as the first image
plot(soilm2023_2c, col=cl)



#se in questa seconda immagine il satellite non è passato dalle stesse coordinate non confronto niente 
#CONFRONTO NON FATTO A LEZ, PROVO
dif <- soilm2023c[[1]]-soilm2023_2c[[1]]
plot(dif, col=cl) #non è uscito ninente, potrebbero non esserci differnze (o non si fa così)

#provo solo a plottarle vicine
par(mfrow=c(2,1))
plot(soilm2023c[[1]], col=cl) #img in alto
plot(soilm2023_2c[[1]], col=cl) #img in basso
#img del 25, satellite max su longitudini 24, dopo no info
#img del 24, satellite min su longitudini 26, prima no info
#per questo non posso fare la differenza
#ma allora la differenza non dovrebbe essere la parte con dati di intrambe in stesso grafico?
