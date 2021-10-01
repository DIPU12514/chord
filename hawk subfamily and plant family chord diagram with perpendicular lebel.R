install.packages("circlize")
library(circlize)
pollen <- read.csv("CHORD DIAGRAM HAWK MOTH.csv")
pollen
grid.col = c(Sphinginae = "green", Macroglossinae = "red",Smerinthinae = "blue", Poaceae = "grey", Brassicaceae  = "black", Rosaceae = "sky blue", Acanthaceae = "navy blue", Araceae = "violet", Salicaceae = "orange", Asteraceae="red",Balsaminaceae="green",Betulaceae="yellow",Verbenaceae="brown",Malvaceae="wheat",Euphorbiaceae="sea green",Oleaceae="Maroon",Ericaceae="red",Elaeocarpaceae="green", Fabaceae="black")
chordDiagram(pollen,annotationTrack = "grid", preAllocateTracks = 2, grid.col = grid.col)
circos.trackPlotRegion(track.index = 1, panel.fun = function(x, y) {
  xlim = get.cell.meta.data("xlim")
  ylim = get.cell.meta.data("ylim")
  sector.name = get.cell.meta.data("sector.index")
  circos.text(mean(xlim), ylim[1] + .1, sector.name, facing = "clockwise", niceFacing = TRUE, adj = c(0, 0.5))
  circos.axis(h = "top", labels.cex = 0.5, major.tick.percentage = 0.1, sector.index = sector.name, track.index = 2)
}, bg.border = NA)
