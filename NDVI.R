library(ncdf4)
library(terra)
library(imageRy)
#Normalized Difference Vegetation Index

#The Normalized Difference Vegetation Index (NDVI) is an indicator of the greenness of the biomes.
#Even though it is not a physical property of the vegetation cover, its very simple formulation 
#NDVI = (REF_nir – REF_red)/(REF_nir + REF_red)
#where REF_nir and REF_red are the spectral reflectances measured in the near infrared and red wavebands respectively, makes it widely used for ecosystems monitoring.

setwd("/Users/emilybenzi/Desktop/spatial ecology")
NDIVi99 <- rast("c_gls_NDVI_199901010000_GLOBE_VGT_V3.0.1.nc")
NDIVi99
plot(NDIVi99)
NDVI99 <- NDIVi99[[1]]
plot(NDVI99)
?rast
extp <- c(10, 11, 46, 46.5)
NDVI_A99 <- crop(NDVI99, extp)
plot(NDVI_A99)

#
NDVi20 <- rast("c_gls_NDVI_202001010000_GLOBE_PROBAV_V3.0.1.nc")
NDVi20
NDVI20 <- NDVi20[[1]]
plot(NDVI20)
NDVI_A20 <- crop(NDVI20, extp)
plot(NDVI_A20)

par(mfrow=c(2,1))
plot(NDVI_A99)
plot(NDVI_A20)

cl <- colorRampPalette(c("yellow", "orange", "red")) (100)
plot(NDVI_A99, col=cl)
plot(NDVI_A20, col=cl)

#comunque, questi sono dati processati, per fare analisi sui valori di riflattanza mi servono tutti altri dati, raw data, dove li trovo?

bo <- im.impo("c_gls_NDVI_PROD-DESC_202001010000_GLOBE_PROBAV_V3.0.1.xml")
