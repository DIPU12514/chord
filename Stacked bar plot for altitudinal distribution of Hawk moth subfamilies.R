data <-read.csv("Copy of Book1.csv")
data
data <- as.matrix(data.frame (Tropical.wet.evergreen = c(9,6,3),Subtropical.montane = c(21, 1, 3),Temperate.evergreen = c(14,6,2)))
rownames(data) <- c("Macroglossinae", "Smerinthinae","Sphinginae")
data
barplot(data,col = c("#1b98e0", "#413436", "#423457"), beside=TRUE)
legend("topright",legend = c("Macroglossinae", "Smerinthinae","Sphinginae"),
       fill = c("#1b98e0", "#353436", "#423457"))
