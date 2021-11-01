install.packages("ggplot2")
install.packages("ggforce")
install.packages("ggdist")
install.packages("gghalves")
install.packages("RColorBrewer")
install.packages("scico")
library(ggplot2)
library(ggforce)
library(ggdist)
library(gghalves)
library(RColorBrewer)
library(scico)
theme_set(theme_light(base_size = 16))
POLLEN <- read.csv("POLLEN CARRYING CAPACITY.csv")
POLLEN
#VIOLINE PLOT
g1 <- ggplot(POLLEN, aes(SUBFAMILY, POLLEN.LOAD)) + geom_violin(fill = "red") + geom_boxplot(width = .2, outlier.shape = NA, coef = 0)
g1
#BOXPLOT  WITH DISTRIBUTION DOT
ggplot(POLLEN, aes(SUBFAMILY, POLLEN.LOAD)) + ggdist::stat_halfeye(adjust = .8, width = .3, .width = c(0.5, 1)) + 
  ggdist::stat_dots(side = "left", dotsize = .4, justification = 1.05, binwidth = .1)
#BOXPLOT WITH DISTRIBUTION JITTER
ggplot(POLLEN, aes(SUBFAMILY, POLLEN.LOAD)) + ggdist::stat_halfeye(adjust = .5, width = .5, .width = c(.5, .95), justification = -.2, point_colour = NA, fill= "brown") + geom_boxplot(width = .09, outlier.shape = NA, fill= "grey") +gghalves :: geom_half_point( side = "l" , range_scale = .4, alpha =.3 )+coord_flip() 

+theme_minimal( )+theme(panel.grid = element_blank())
                                                                                                                                                                                                                               
