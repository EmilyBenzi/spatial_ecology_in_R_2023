##external data
library(terra)
#se cerchi questo package su internet ti dice tutte le funzioni che ha dentro, cosa fanno ecc.

#NASA's earth systems observatory
#ESA euopian spacial agency

#Earth observatory -> dati prrocessati/pre analizzati
#Sentinel 2 (10m risoluzione spaziale) ->ESA
#landsat (30m risoluzione spaziale) NASA
#Modis (diverse risoluzioni spaziali a partire da 500m) NASA
#Copernicus (tra cui Sentinel 2) ESA


#NASA earth observatory
#changing Najaf
#img 20/05/2003
#set the working directory [or print workin directory (pwd)] fz: setwd("path") 
#"path"= copia e incolla quello che indica in "situato in" nei dettagli del dataset in quetsione scaricato
#=scrivere il path per arrivare al dataset salvato nel nostro computer (in \ no, usare solo /)
setwd("/Users/emilybenzi/Desktop/spatial ecology")
#no errori = siamo nel working directory

rast("najafiraq_etm_2003140_lrg.jpg") #like im.import() che è sul package imageRy
#in "" si mette il nome completo dell'immagine che abbiamo salvato; sempre in "dettagli immagine"

#associamo variabile a questa immmagine in modo da poterla richiamare piu facilemnte per usarla su R
naja <- rast("najafiraq_etm_2003140_lrg.jpg")

plotRGB(naja) #questa funzione è come im.plotRGB che usavamo sul pack imageRy


#download the second image grom August (7/08/2023)
#non c'è piu bisogno di impostare il working directory perchè è lo stesso di prima
rast("najafiraq_oli_2023219_lrg.jpg")
naja2 <- rast("najafiraq_oli_2023219_lrg.jpg")
plotRGB(rast("najafiraq_oli_2023219_lrg.jpg"))

#plot them together
par(mfrow=c(2,1))
plotRGB(naja)
plotRGB(naja2)

#multi-temporal change detection
najadif= naja[[1]]-naja2[[1]]
cl1 <- colorRampPalette(c("brown" , "grey" , "orange")) (100)
dev.off()
plot(najadif, col=cl1)
