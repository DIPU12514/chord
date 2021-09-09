data <- data.frame(x = letters[1:10],y = 1:10)
data
data
install.packages("ggplot2")                  
library("ggplot2")
ggp <- ggplot(data, aes(x, y, fill = x)) +geom_bar(stat = "identity")
ggp+scale_fill_brewer(palette = 7, direction = 1) 
