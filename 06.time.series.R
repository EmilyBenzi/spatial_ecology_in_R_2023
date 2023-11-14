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


##Temperature in Greenland
im.list()
#greenland20... dati di tmeperature
im.import("greenland.2000.tif")
g2000 <- im.import("greenland.2000.tif")
plot(g2000)
plot(g2000, col=cldif)
#temperatura della superfice (no aria) nel 2000.
#c'è una zona interna dove c'è ghiaccio e neve perenne, menter in zona costiera temp piu alta
#importiamo tutti i dati greenland insieme
g2005 <- im.import("greenland.2005.tif")
g2010 <- im.import("greenland.2010.tif")
g2015 <- im.import("greenland.2015.tif")
plot(g2015, col=cldif)
#il blu piu intenso (+ freddo) si sta restringendo
clg <- colorRampPalette(c("black", "blue", "white", "red")) (100)
plot(g2015, col=clg)

par(mfrow=c(2,1))
plot(g2015, col=clg)
plot(g2000, col=clg)
#si puo vedere che zona piu fredda, ora nera, si è ristretta, indicando una grande perdita di ghiaccio

#uniamo le immagini=dati dei diversi anni creando così diverse bads concatenate
stackg <- c(g2000, g2005, g2010, g2015)
plot(stackg, col=clg)
#abbiamo stack tutto insime e plottato 

                   ##########tutto da correggere############
dev.off()

#make the difference between the first and the final elements of the stack
difg= g2000[[1]] - g2015[[1]]
plot(difg, col=cldif)
#NO dopo spiego (non hannoo band quidni selezionando 1 seleziono tutto)

difgiusto<- stackg[[1]] - stackg[[4]]
# =difgiusto <- g2000 - g2015
plot(difgiusto, col=cldif)


#make RGB plot using different years
#possiamo usare RGB space to plot just some of that
#quidni ad ogni img, corrispondente ai dati dele temp di diversi anni, asociamo un colore per i valori alti
#dove sarà rosso significa che la bands che gli si ha associato ha i valori piu alti di tutti

# io pensavo cosi, ma no: im.plotRGB(stackg, red="g2000", green="g2005", blu="g2015")
im.plotRGB(stackg, r=1, g=2, b=4)
#conffrontato temp tra 2000 (1), 2005 (2) e 2015 (4); no 2010 (3)
#dove è blu/nero significa che le temperature piu alte sono nella parte finale della linea tmeporale => magggiore 2015 che 2000
