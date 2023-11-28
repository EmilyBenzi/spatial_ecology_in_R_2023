##Copernicus datas

#https://land.copernicus.vgt.vito.be/PDF/portal/Application.html

library(ncdf4)
library(terra)
#set the working directory
setwd("/Users/emilybenzi/Desktop/spatial ecology")

#import the datas
soilm2023 <- rast("c_gls_SSM1km_202311250000_CEURO_S1CSAR_V1.2.1.nc")
soilm2023
plot(soilm2023) #una è l'immagine reale of soil monstur, l'altra its nois, so the amount of error

#select only the fisrt image
plot(soilm2023[[1]])

#change colores
cl <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(soilm2023[[1]], col=cl)

#non ho capito cosa sia questa immagine

#make a crop of the image
#in questo caso l'estensione riporta la longitudine minima, massima, la latitudine minima. quella massima
ext <- c(22, 26, 55, 57) #i numeri sono i valori di #minlong #maxlong #minlat #maxlat che si vedono nell'immagine
#in questo modo, anche scaricando un'altra immagine si potranno selezionare le stesse coordinate, così da confrontare lo stesso punto con diverse variabili o in diversi momenti

#creiamo il nuovo oggetto
soilm2023c <- crop(soilm2023, ext)
plot(soilm2023c, col=cl)
#anche in questo caso abbiamo le 2 immagini e selezioniamo solo la prima
plot(soilm2023c[[1]], col=cl)
