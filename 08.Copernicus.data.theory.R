##Copernicus data, theory

### -> vegetation variables:

##1)Leaf area index: 
#is defined as half the total area of green elements (LAI) of the canopy per unit horizontal ground area.
#Practically, the LAI quantifies the thickness of the vegetation cover.

##2)Land Cover
#these maps represent spatial information on different types (classes) of physical coverage of the Earth's surface

##3)FAPAR (Fraction of Absorbed Photosynthetically Active Radiation):
#quantifies the fraction of the solar radiation absorbed by live leaves for the photosynthesis activity.
#it refers only to the green and alive elements of the canopy.

##4)NDVI (Normalized Difference Vegetation Index):
#is an indicator of the greenness of the biomes.
#is not a physical property of the vegetation cover
#its very simple formulation: NDVI = (REF_nir – REF_red)/(REF_nir + REF_red)
#where REF_nir and REF_red are the spectral reflectances measured in the near infrared and red wavebands respectively, makes it widely used for ecosystems monitoring.

##5)VCI (Vegetation Condition Index):
#compares the current NDVI to the range of values observed in the same period in previous years. 
#is expressed in % and gives an idea where the observed value is situated between the extreme values (minimum and maximum) in the previous years. 
#Lower and higher values indicate bad and good vegetation state conditions, respectively.

##6)VPI (Vegetation Productivity Index)
#assesses the overall vegetation condition by referencing the current value of the NDVI with the long-term statistics for the same period. 
#is a percentile ranking of the current NDVI value against its historical range of variability
#values of 0%, 50% and 100% respectively indicate that the current observation corresponds with the historical minimum (worst vegetation state), median (normal) or maximum (best situation) ever observed.

##7)DMP (Dry Matter Productivity and Net Primary Production)
#represents the overall growth rate or dry biomass increase of the vegetation 
#expressed in kilograms of dry matter per hectare per day (kgDM/ha/day). 
#It is directly related to ecosystem Net Primary Production (NPP), expressed in gC/m²/day. 

##8)Burnt Area
#products map burn scars, surfaces which have been sufficiently affected by fire to display significant changes in the vegetation cover and in the ground surface.

##9)Soil water Index
#quantifies the moisture condition at various depths in the soil.
#mainly driven by the precipitation

##10)SSM (Surface Soil Moisture)
#is the relative water content of the top few centimetres soil.
#expressed in percent saturation.

##11)FAPAR (Fraction of Absorbed Photosynthetically Active Radiation)
#quantifies the fraction of the solar radiation absorbed by live leaves for the photosynthesis activity.
#it refers only to the green and alive elements of the canopy.


### -> energy variables:

##1)TOC (Top Of Canopy Reflectances)
#The Top-Of-Canopy spectral reflectance quantifies the fraction of the sunlight reflected by the surface of the Earth, in a given spectral band. 
#it depends on the illumination and viewing angular conditions. 
#it is necessary to normalize the measurements into a same angular configuration. 
#The resulting value is the normalized TOC reflectance.

##2)Surface Albedo
#The surface albedo quantifies the fraction of the sunlight reflected by the surface of the Earth.

##3)LST (Land Surface Temperature)
#is the radiative skin temperature of the land surface, as measured in the direction of the remote sensor. 
#is estimated from Top-of-Atmosphere brightness temperatures
#Its estimation further depends on the albedo, the vegetation cover and the soil moisture.

### -> Water cycle variables:

##1)LSWT (Lake Surface Water Temperature):
#describes the temperature of the lake surface, one important indicator of lake hydrology and biogeochemistry. 
#Temperature trends observed over many years can be an indicator of how climate change affects the lake.

##2)Lake Water Quality
#Monitoring water quality in lakes and reservoirs is key in maintaining safe water. 
#Long and short-term changes are indicators of environmental health and changes in the water catchment area. 
#record consists of three water quality parameters:
#turbidity 
#trophic state index (in terms of phytoplankton and indirectly reflects the eutrophication)
#lake surface reflectances

##3)Water Bodies
#detects the areas covered by inland water along the year providing the maximum and the minimum extent of the water surface as well as the seasonal dynamics. 

##4)Water Level
#is defined as the height, in meters above the geoid, of the reflecting surface of continental water bodies. 
#It is observed by space radar altimeters that measure the time it takes for radar pulses to reach the ground targets, directly below the spacecraft (nadir position), and return.  


### -> Cryosphere variables:

##1)Snow Cover Extent
#Snow cover is highly sensitive to changes in temperature and precipitation and affects directly the albedo and thus the energy balance of the Earth’s surface. 
#It is a relevant input parameter for weather forecasts and climate change observations. 
#Snow stores a significant mass of water and, with its high dynamic, has a strong effect on regional and global energy and water cycles. 
#The up-to-date knowledge about the snow cover extent is an important information for hydrological runoff modelling and for assessing natural hazards such as flood events.

#2)LIE (Lake Ice Extent) 
#classifies ice for freshwater bodies, per cloud-free pixel, into:
#Fully snow covered ice
#Partially snow covered ice/clear ice
#Open water
#Lake ice is a good climate indicator

##3)SWE (Snow Water Equivalent)
#describes the equivalent amount of liquid water stored in the snow pack. 
#It indicates the water column that would theoretically result should the whole snow pack melt instantaneously
#is defined as product between the snow layer’s depth and density.
