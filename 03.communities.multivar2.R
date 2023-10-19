#vegetation analysis
library(vegan)
data(dune)
dune
#obtain a metric of several plots in the raws an species in columns, with their abundance
#head function allows to obtail only few raaws of datas (tipically firts 6)
#we have to make a multivar. analisisy to compeare datas
#detrended correspondance analysis (DCA) method for modiie data in a simple way
#decorana function another way to do the same thigs that DCA does
ord <-decorana(dune)
#in this way we obtain how much long 
#we are going to mesure pc1
ldc1 = 3.7004
ldc2 = 3.1166
ldc3 = 1.30055
ldc4 = 1.47888
total= ldc1+ ldc2 +ldc3 + ldc4
pldc1 = ldc1*100/total
pldc2 = ldc2*100/total
pldc3 = ldc3*100/total
pldc4 = ldc4*100/total
#lets see how much of cumulative persantege they can express
pldc1+pldc2
#the result is enought (enought %), we can use only these two
#final output
plot(ord)
#new axes are dc1 and dc2 and number a the origina plots, but the most important things are the reciproc position of species

#aggiungere commenti da R
