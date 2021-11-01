install.packages(c("FactoMineR", "factoextra"))
install.packages("ggplot2")
library("FactoMineR")
library("factoextra")
library("ggplot2")
hawk <- read.csv("Book1.csv",row.names = 1)
hawk
hawk_data <- hawk[,1:3]
hawk_data
PCA(hawk_data, scale.unit = TRUE, ncp = 16, graph = TRUE)
library("FactoMineR")
res.pca <- PCA(na.omit(hawk_data), graph = FALSE)
print(res.pca)
eig.val <- get_eigenvalue(res.pca)
eig.val
library("factoextra")
fviz_eig(res.pca, choice = "eigenvalue", addlabels=TRUE)
install.packages("stringi")
library(stringi)
fviz_eig(res.pca, addlabels = TRUE, ylim = c(0, 50))
var <- get_pca_var(res.pca)
var
# Coordinates
head(var$coord)
# Cos2: quality on the factore map
head(var$cos2)
# Contributions to the principal components
head(var$contrib)
fviz_cos2(res.pca, choice = "var", axes = 1:3)
# Color by cos2 values: quality on the factor map
fviz_pca_var(res.pca, col.var = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
             repel = TRUE)
fviz_pca_var(res.pca, col.var = "contrib",gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"))
res.desc <- dimdesc(res.pca, axes = c(1,2), proba = 0.05)
res.desc$Dim.1
res.desc$Dim.2
ind <- get_pca_ind(res.pca)
ind
# Coordinates of individuals
head(ind$coord)
# Quality of individuals
head(ind$cos2)
# Contributions of individuals
head(ind$contrib)              
fviz_pca_ind(res.pca)                
fviz_pca_ind(res.pca, col.ind = "cos2", gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),repel = TRUE )           
fviz_pca_ind(res.pca, col.ind = "cos2", gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),repel = TRUE)             
fviz_pca_ind(res.pca, pointsize = "cos2", pointshape = 21, fill = "#E7B800", repel = TRUE)
fviz_cos2(res.pca, choice = "ind")
fviz_contrib(res.pca, choice = "ind", axes = 1:2)
hawk
my.cont.var <- rnorm(16)
fviz_pca_ind(res.pca, col.ind = my.cont.var,
             gradient.cols = c("blue", "yellow", "red","green","black","brown","orange","sky blue","grey","violet","sea green","black","sea green","violet","red","black","yellow"),
             legend.title = "Cont.Var")
head(hawk, 16, row.names=1)
hawk.pca <- PCA(hawk[,-5], graph = FALSE)
fviz_pca_biplot(res.pca, repel = TRUE,
                col.var = "#2E9FDF", 
                col.ind = "#E7B800" )                
