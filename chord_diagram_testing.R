#install circlize package
install.packages("circlize")
#load circlize package
library(circlize)
chord = read.csv("17.csv")
#viw your matrix data
chord
#basic chord diagram
chordDiagram(chord)
#change grid colour
grid.col = c(crow = "red", oriole = "green", shrike = "blue", robin= "black", pigeon= "orange",
             bu= "grey", asika = "grey", hinjili = "grey", narayanpur = "grey", gopalpur = "grey", koraput = "grey")
#plot changed grid coloured chord Diagram
chordDiagram(chord, grid.col = grid.col)
#testing done

