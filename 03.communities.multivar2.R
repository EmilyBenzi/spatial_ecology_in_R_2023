##vegetation analysis
library(vegan)
data(dune)
dune
#obtain a metric of several plots in the rows an species in columns, with their abundances
#head function allows to obtain only few rows of data (tipically firts 6)
head(dune)
#tail function to see only final rows  [appunto]
#we have to make a multivar. analisisy to compare data
#detrended correspondance analysis (DCA) method for modify datas in a simple way
#decorana function, another way to do the same things that DCA does
ord <-decorana(dune)
#in this way we obtain how much long are axes
ord
#let's measure length of dca1/2/3/4
ldc1 = 3.7004
ldc2 = 3.1166
ldc3 = 1.30055
ldc4 = 1.47888
#let's calculate the total length of axes
total= ldc1+ ldc2 +ldc3 + ldc4
#let's calculate the %length of the total length
pldc1 = ldc1*100/total
pldc2 = ldc2*100/total
pldc3 = ldc3*100/total
pldc4 = ldc4*100/total
#let's check the %
pldc1
pldc2
pldc3
pldc4
#evaluating the cumulative % of pldc1 and pldc2
pldc1+pldc2
#the result is enough (enough %), we can use only these two
#let's create the final output
plot(ord)
#new axes are dc1 and dc2 and number are the original plots, but the most important things are the mutual position of species

#COMMENTS
#relative positions represent the relationship between species
#in particular the proximity of two species indicates a sharing of habitat
#resulting in similar necessary environmental characteristics
#example 1: in the bottom left part there are the species Achimill and Bromhord that are close, so the should share the habitat and his conditions
#in fact, even in the reality they are grassland plant
#example 2: in the up right part there are species characteristic of wetlands
