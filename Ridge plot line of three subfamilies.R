install.packages("ggplot2")
library("ggplot2")
install.packages("ggridges")
library("ggridges")
data <-data.frame(x = 1:1000, y = rep(1, 1000), height = c(0, 1, 3, 4, 2))
sphinx <-read.csv("POLLEN LOAD FINAL.csv")
sphinx
ggplot(sphinx,aes(x=pollen.load, y= subfamilies, group=subfamilies)) + geom_density_ridges(fill = "#00AFBB")
data("lincoln_weather")
ggplot(sphinx,aes(x= `pollen.load`, y=`subfamilies` , fill=stat(x))) + geom_density_ridges_gradient(scale = 3, size = 0.3, rel_min_height = 0.01) + scale_fill_viridis_c(name="pollen.load", option="c") + labs(title = "variation in pollen carrying capacity among different subfamilies")

