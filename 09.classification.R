##classifying satellite images and estimate the amount of change

#passare da immagine originale a classi (land use classes)
#partendo da una immagine satellitare
#considerando 2 bands (red  in x and IR in y)
#prendendo un qualsiasi pixel (es. corrispondente a vegetaazione, che sappiamom riflette molto IR avrè basso x e alto y)
#considerando vari punti=pixel nell'immagine, questi si posizioneranno, in funzione della loro riflettanza, nel grafico delle bands'
#questi pixel sono chiamati training site
#che "spiegano" al sistema come riconosscere  cluster insieme di oggetti con stesse caraatteristiche 
#in esempio di img. abbiamo cluster agricoltura, foresta, acqua
#dopo aver creato questi cluster, prendendo un qualsiasi nuovo punto nell'immagine è possibile assegnargli una classe in funzione della distanza minima del punto ad una certa calsse (sarà piu probabile che questo punto, con la sua riflettanza corrisponde alla classe piu vicina)
#per fare qeusto in imagery è a disposizione la funzione "im."


library(imageRy)
library(terra)

im.list()
#c'è una immainge "solar_orbiter...", su questo si puo valutare la quantità di energia del sole ad esempio 
#(puoi cercare quel paramtro su internet)
#in funzione di questi colori sono associati diversi valori di energia + alto=giallo medio=marrone -=nero

#ora classifichiamo questa immagine, spieghiamo al software quali sono i cluster (ce ne aspettiamo 3)



sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

sunc <- im.classify(sun, num_clusters=3) #le immagini verrano simili, ma non ugualii anche con stessa img, computer puo usare diverse random classification

plot(sunc)

#per capire a quale livello di energia corrispondono le classi create si devono comparare ad immagine originale 
#classe 1 = minima energia 
#classe 2 = alta energia 
#classe 3 = media energia

##classify satellite data
#usaimo ora delle immgaini di matogrosso

im.list()
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg") #waning massage è soo perchè non ci sono le coordinate dell'immagine 
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
#ricorda ross=vegetazione, l'acqua non è nera perche ci sono mlti solidi disciolti quidni viene come la terra 

#nella immagine del 1992 potrebbe essere complicato distingure le classi perchè l'immagine è molto frammentata

m1992c <- im.classify(m1992, num_clusters = 2) #non abbiamo messo la classe dell'acqua, che risulta come terra

plot(m1992c)
#classe 1 vegetazione 
#classe 2 terra/agricoltura/intervento umano
#computer usa rondom pixel per partire con classificazione 


#lassifichiamo la seconda immagine
m2006c <- im.classify(m2006, num_clusters = 2)
plot(m2006c)
#in questo caso classe 1= vegetazione (bianco), classe 2 =terra (verde)

par(mfrow=c(1,2))
plot(m1992c[[1]])
plot(m2006c[[1]])
#abbiamo selezionato la prima immagine per poterle confrontare, in questa ersione del programma ne plotta 3, ma sono tutte uguali
#riscaricare imagery

#voglimo capire ora qual'è la proporzione di ogni classe
#c'è una unzione "freq()" (calcola la frequenza dei pixel di una certa classe)
f1992 <- freq(m1992c)
f1992
#avendo 3 mappe si ripetono 3 volte 
#comunque in ogni caso "count" indica il numero di pixel della classe corrispondente
#possimao quindi calcolare la percentuale di una certa classe
#troviamo il totale di pixel dell'immagine con la funzione ncell (funziona in ogni immagine)

tot1992 <- ncell(m1992c)
tot1992

#caloliamo la percentuale
p1992 <- f1992 * 100 / tot1992
p1992
#i valori corripspondenti alla % sono quelli in "count"
#abbiamo che classe 1 = terra=16.9%
#classe 2 =foresta =83%

#facciamo lo stesso per l'immagine del 2006
f2006 <- freq(m2006c)
f2006
tot2006 <- ncell(m2006c)
tot2006

p2006 <- f2006 * 100 / tot2006
p2006
#abbiamo che classe 1 = foresta=45.3%
#classe 2 =terra =54.69%
#"layer" indica la mapa (ne abbiamo 1 infatti)
#anche in questo caso le % possono essere un po diverse in funzione del computer

#facciamo ora una tabella con questi dati
#"data.frame()" permette di formare una tabella dove nelle riche abbiamo le classi e nelle colonne le due immagini, così da conforntare le percentuali di ogni classe a confronto

#building the fiinal table
class <- c("forest", "human")
y1992 <- c(83, 17) #i numeri sono le percentuali del 1992
y2006 <- c(45, 55)
#così abbiamo definito le colonne


tab <- data.frame(class, y1992, y2006) #come statistica
tab
#prima tanta foresta, poi quasi uguali

#ora plottiamo il grafico, le funzioni per fare cio sono nel pack "ggplot"
p1 <- ggplot(tab, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white")
p1
#ottenisamo il grafico delle percentuali nel 1992
p2 <- ggplot(tab, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white")
p2
#percetnuale delle componeneti nel 2006

#ora possiamom unirli in modo da confrontarli al meglio
#sfurttiamo il pack patch... (cercare funzioni su internet)

p1+p2
#ora liabbiamo insieme, ma le scale sono diverse, non è chiaro l'ammount del problema

#dobbiamo metterelo stesso limite alla y, che vogliamo essere uguale al 100 perchè sono %
#funzione ylim()
p1 <- ggplot(tab, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p2 <- ggplot(tab, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p1 + p2
