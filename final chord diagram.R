install.packages("circlize")
library(circlize)
pollen <- read.csv("CHORD DIAGRAM HAWK MOTH.csv")
pollen
grid.col = c(Sphingidae = "green", Macroglossinae = "red",Smerinthinae = "blue", Poa = "grey", Brass  = "black", Ros = "sky blue", Acan = "navy blue", Ara = "violet", Sal = "orange", Ast="red",Bals="green",Betu="yellow",Verb="brown",Mal="wheat",Eup="sea green",Ole="Maroon",Eri="red",Elae="green", Fab="black")
chordDiagram(pollen,grid.col = grid.col)
