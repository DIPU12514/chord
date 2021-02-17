df <- data.frame(biogeographic_zone=c(
         moth_species=c())
head(df)
install.packages("ggplot2")
library(ggplot2)
# Basic barplot
p<-ggplot(data=df, aes(x=biogeographic_zone, y=moth_species)) +
  geom_bar(stat="identity", fill=alpha("blue", 0.4)) +  
  ylim(-120,650) +
  theme_minimal() +
  theme(
    axis.text = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    plot.margin = unit(rep(-1,4), "cm") 
  ) +
  coord_polar(start = 0)
p

# Horizontal bar plot
p + coord_flip()
# Change the width of bars
ggplot(data=df, aes(x=biogeographic_zone, y=moth_species)) +
  geom_bar(stat="identity", width=0.5)
# Change colors
ggplot(data=df, aes(x=biogeographic_zone, y=moth_species)) +
  geom_bar(stat="identity", color="blue", fill="white")
# Minimal theme + blue fill color
p<-ggplot(data=df, aes(x=biogeographic_zone, y=moth_species)) +
  geom_bar(stat="identity", fill="steelblue")+
  theme_minimal()
p
# bar plot with lables
# lables will be on the top of the bars
ggplot(data=df, aes(x=biogeographic_zone, y=moth_species)) +
  geom_bar(stat="identity", fill="steelblue") 
  geom_text(aes(label=moth_species), vjust=-0.3, size=3.5)+
  theme_minimal() 
# lables will be inside of the bars
ggplot(data=df, aes(x=biogeographic_zone, y=moth_species)) +
  geom_bar(stat="identity", fill="steelblue")+ ylim(-100,750) +
  geom_text(aes(label=moth_species), vjust=1.6, color="black", size=2.5)+
  theme_minimal() + coord_polar(start = 0) 
# Change barplot colors by groups
# Change outline colors
# Change barplot line colors by groups
p<-ggplot(df, aes(x=biogeographic_zone, y=moth_species, color=moth_species)) +
  geom_bar(stat="identity", fill="white")
p
# Change barplot fill colors by groups
p<-ggplot(df, aes(x=biogeographic_zone, y=moth_species, color=moth_species)) +
  geom_bar(stat="identity")+theme_minimal()
p
# Use custom color palettes
p+scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))
# use brewer color palettes
p+scale_fill_brewer(palette="Dark2")
# Use grey scale
p + scale_fill_grey()
ggplot(df, aes(x=biogeographic_zone, y=moth_species, color=moth_species))+
  geom_bar(stat="identity", color="black")+
  scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))+
  theme_minimal()


# alternate code
H <- c(1,109,249,53,4, 42, 177, 93, 123, 77, 328, 102, 56, 117)
M <- c("Trans Him","NW Him","Central Him","Eastern Him","Desert", "Semi Arid", "Western Ghats", "Deccan plateau", "Gangetic plains", "coast", "NE India", "Islands", "Throughout India", "India")
barplot(H,names.arg= M, las=2, ylab="Number of moth species",col="#00FFFF",
        main="Spilomelinae",border="red")
      

