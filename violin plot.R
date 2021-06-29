install.packages("ggplot2")
library("ggplot2")
sphinx <-read.csv("34.csv")
sphinx
data("ToothGrowth")
sphinx$FAMILY <- as.factor(sphinx$FAMILY)
head(sphinx)
p<-ggplot(sphinx, aes(x=FAMILY, y=ALTITUDE,fill=FAMILY)) + geom_violin(trim=FALSE)+theme_minimal( ) +theme(panel.grid = element_blank())
p+geom_jitter(shape=16, position=position_jitter(.05))+stat_summary(fun=median, geom="point", size=2, color="RED")

                              