##classifying satellite images and estimate the amount of change

#going from original image to classes (land use classes)
#starting from a satellite image
#considering 2 bands (red in x and IR in y)
#taking any pixel (e.g., corresponding to vegetation, which we know reflects a lot of IR; it will have low x and high y)
#considering various points = pixels in the image, these will be positioned, depending on their reflectance, in the band graph.
#these pixels are called training sites
#which "teach" the system how to recognize clusters of objects with the same characteristics.
#in example image. We have clusters of agriculture, forest, and water.
#After creating these clusters, by taking any new point in the image, it is possible to assign it a class based on the minimum distance from the point to a certain class (it will be more likely that this point, with its reflectance, corresponds to the closest class).
#To do this, the function "im.classify("img name", num_classrs="n") is available in Imagery.

install.packages("ggplot2")
library(imageRy)
library(terra)
library(ggplot2)
install.packages("patchwork")
library(patchwork)

im.list()
#There's a "solar_orbiter..." image, which can be used to evaluate the amount of energy from the sun, for example.
#(You can search for that parameter online.)
#These colors are associated with different energy values. + High = yellow, medium = brown, - = black.

#Now let's classify this image and tell the software which clusters there are (we expect 3).


sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

sunc <- im.classify(sun, num_clusters=3) #images will be similar, but not the same even with the same img, computer can use different random classifications

plot(sunc)

#To understand the energy level of the created classes, you must compare them to the original image.
#class 1 = minimum energy
#class 2 = high energy
#class 3 = medium energy

#classify satellite data
#use matogrosso images now

im.list()
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg") #waning massage is just because there are no image coordinates
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
#remember ross=vegetation, the water isn't black because there are a lot of dissolved solids, so it looks like earth.

#in the 1992 image, it might be difficult to distinguish the classes because the image is very fragmented.

m1992c <- im.classify(m1992, num_clusters = 2) #we didn't put the water class, which appears as earth

plot(m1992c)
#Class 2 Vegetation (Green)
#Class 1 Land/Agriculture/Human Intervention (White)
#Computer uses round pixels to start with classification

#let's classify the second image
m2006c <- im.classify(m2006, num_clusters = 2)
plot(m2006c)
#in this case class 1 = vegetation (white), class 2 = earth (green)

par(mfrow=c(1,2))
plot(m1992c[[1]])
plot(m2006c[[1]])
#We selected the first image to compare them. This version of the program plots three, but they're all the same.
#Redownload Imagery

#Now we want to understand the proportion of each class.
#There's a "freq()" function (calculates the frequency of pixels in a given class).
f1992 <- freq(m1992c)
f1992
#having 3 maps, they are repeated 3 times
#in any case, "count" indicates the number of pixels in the corresponding class
#we can therefore calculate the percentage of a certain class
#we find the total number of pixels in the image with the ncell function (it works on every image)

tot1992 <- ncell(m1992c)
tot1992

#let'scalculatethepercentage
p1992 <- f1992 * 100 / tot1992
p1992
#the values corresponding to the % are those in "count"
#we have that class 1 = land = 16.9%
#class 2 = forest = 83%
#let's do the same for the 2006 image
f2006 <- freq(m2006c)
f2006
tot2006 <- ncell(m2006c)
tot2006

p2006 <- f2006 * 100 / tot2006
p2006
#we have that class 1 = forest = 45.3%
#class 2 = land = 54.69%
#"layer" indicates the map (we actually have 1)
#even in this case the %s may vary slightly depending on the computer

#let's now create a table with this data
#"data.frame()" allows you to create a table where the rows contain the classes and the columns contain the two images, so you can compare the percentages for each class.

#building the final table
class <- c("forest", "human")
y1992 <- c(83, 17) #the numbers are percentages from 1992
y2006 <- c(45, 55)
#this is how we defined the columns

tab <- data.frame(class, y1992, y2006) #come statistica
tab
#first a lot of forest, then almost the same

#now let's plot the graph; the functions for this are in the "ggplot" pack
p1 <- ggplot(tab, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white")
p1
#we get the percentage graph in 1992
p2 <- ggplot(tab, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white")
p2
#percentage of components in 2006

#now we can combine them so we can better compare them
#let's use the patch pack... (search for features on the internet)

p1+p2
#Now we have them together, but the scales are different, the magnitude of the problem is unclear.

#We need to set the same limit on the y-value, which we want to be equal to 100 because it's %
#ylim() function
p1 <- ggplot(tab, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p2 <- ggplot(tab, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p1 + p2

