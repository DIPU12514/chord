install.packages("rioja")
library("rioja")
POLLEN <- read.csv("Book1.csv",header=TRUE)
POLLEN1 <-POLLEN[-1]
y.scale <- 1:65
p.col.group <- c(rep("blue", times=11), rep("red", times=9), rep("green", times=10), rep("brown", times=7),rep("violet",times=4), rep("yellow",times=5),rep("black",times=9), rep("orange",times=2),rep("grey",times=8))
pol.plot <- strat.plot(POLLEN1, yvar=y.scale, y.tks=y.scale, y.rev=TRUE, plot.line=FALSE, plot.poly=FALSE, plot.bar=TRUE, col.bar=p.col.group, lwd.bar=4, sep.bar=TRUE, scale.percent=TRUE, xSpace=0.01, x.pc.lab=TRUE, x.pc.omit0=TRUE, las=2)
par(fig=c(0.01,1, 0.08, 0.8))
axis(2, at=y.scale, labels=row.names(POLLEN1), las=2)


