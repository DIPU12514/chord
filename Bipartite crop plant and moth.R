install.packages("bipartite")
library(bipartite)
mothweb <- read.csv("Bipartite.csv", row.names = 1)
View(mothweb)
plotweb(mothweb)
?plotweb
data(Safariland)
plotweb(Safariland)
# shorter labels
plotweb(sortweb(mothweb, sort.order="dec", sequence = seq.higher), high.lablength=3, low.lablength=0, arrow="down")
# centered triangles for displaying interacions
plotweb(sortweb(mothweb, sort.order="inc", sequence = seq.higher), text.rot=90, method="normal", 
         arrow="both",col.low=c("orange","green","blue","brown","navy blue","pink","yellow","black", "sky blue","red","grey" ),col.high=c("black"),
        text.high.col=c(rep("blue",26)), col.interaction=c("grey"),
        bor.col.interaction=c(rep("black",40)), y.lim=c(-1,2.5))
#orginal sequence, up arrows and different box width
plotweb(mothweb, method="normal", arrow="up", y.width.low=0.3, low.lablength=4)
# interactions as lines
plotweb(mothweb, arrow="both", y.width.low=0.05, text.rot=90, col.high="blue", 
        col.low="green")
plotweb(mothweb,col.high=c("orange","green"))
# coloured interaction
plotweb(mothweb,col.low=c("orange","green","blue","brown","violet","pink","yellow","black", "sky blue","black","violet" ),col.high=c("black"),
        text.high.col=c("pink"), col.interaction=c("grey"),
        bor.col.interaction=c(rep("black",26)),method="normal", 
        text.rot=90, low.lablength=40, high.lablength=50)
plotweb(Safariland, abuns.type='independent',arrow="down.center")
plotweb(Safariland, abuns.type='additional',arrow="down.center")
plotweb(t(Safariland), y.width.low=0.05, y.width.high=0.1, method="normal", 
        add=TRUE, low.y=1.7,high.y=2.7, col.low="green", text.low.col="black", 
        low.lab.dis=0, arrow="down", adj.low=c(0.5,1.1), low.lablength=4, 
        high.lablength=0)
plotweb(Safariland,col.low=c("orange","green"),col.high=c("white","grey","purple"),
        text.high.col=c("blue","red"), col.interaction=c("red",rep("green",26),rep("brown",242)),
        bor.col.interaction=c(rep("green",26),rep("brown",242)),method="normal", 
        text.rot=90, low.lablength=10, high.lablength=5)
