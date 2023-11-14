# Time series analysis
library(imageRy)
library(terra)
#import data 
im.list()
im.import("EN_01.png")
EN01<-im.import("EN_01.png")
#cosa c'è nellimmagine 01= gennaio 13=marzo.  , conc. NO2?
im.import("EN_13.png")
EN013 <- im.import("EN_13.png")

#vedi con (1,2) cambia direzione in cui olotta immagini

par(mfrow=c(2,1))
im.plotRGB.auto(EN01)
im.plotRGB.auto(EN013)
dif = EN01[[1]] - EN013[[1]] #fai la differenza tra le prime band [1] di ogni immagine 
#abbiamo creato una nuova mappa che riporta la differenza nelle prime bands di ogni img precedente (diff. gennaio marzo)
plot(dif)
dev.off()

#change colors
cldif <- colorRampPalette(c("blue", "white", "red")) (100)
plot(dif, col=cldif)

# ora rosso= piu alto in gennaio, blu=piu alto in marzo
#pianura padana è alto comunque
#vedi madrid molto rossa => hanno drammaticamente smesso di usare amchhine quindi abbattutto emissioni
