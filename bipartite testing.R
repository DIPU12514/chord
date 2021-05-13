library(bipartite)
mothweb <- read.csv("Bipartite.csv", row.names = 1)
View(mothweb)
plotweb(mothweb)
?plotweb
data(Safariland)
plotweb(Safariland)
# shorter labels
plotweb(mothweb, high.lablength=3, low.lablength=0, arrow="down")
# centered triangles for displaying interacions
plotweb(mothweb, text.rot=90, arrow="down.center", col.interaction="wheat2",
        y.lim=c(-1,2.5))
#orginal sequence, up arrows and different box width
plotweb(mothweb, method="normal", arrow="up", y.width.low=0.3, low.lablength=4)
# interactions as lines
plotweb(mothweb, arrow="both", y.width.low=0.05, text.rot=90, col.high="blue", 
        col.low="green")

