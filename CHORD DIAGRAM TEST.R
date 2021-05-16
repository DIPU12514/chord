install.packages("circlize")
library(circlize)
pollen <- read.csv("CHORD DIAGRAM HAWK MOTH.csv")
pollen
chordDiagram(pollen)
