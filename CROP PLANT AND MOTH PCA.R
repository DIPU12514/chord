install.packages(c("FactoMineR", "factoextra"))
library("FactoMineR")
library("factoextra")
proboscis <- read.csv('PCA.csv', row.names = 1)
proboscis
proboscis_data <- proboscis[,1:3]
proboscis_data
PCA(proboscis_data, scale.unit = TRUE, ncp = 5, graph = TRUE)
library("FactoMineR")
res.pca <- PCA(na.omit(proboscis_data), graph = FALSE)
print(res.pca)
library("factoextra")
eig.val <- get_eigenvalue(res.pca)
eig.val
#Scree plot
fviz_eig(res.pca, addlabels = TRUE, ylim = c(0, 50))
#Calculate Variance
var <- get_pca_var(res.pca)
var
# Coordinates
head(var$coord)
# Cos2: quality on the factore map
head(var$cos2)
# Contributions to the principal components
head(var$contrib)
# Correlation circle
# Coordinates of variables
head(var$coord, 3)
# Plotting variable correlation plot
fviz_pca_var(res.pca, col.var = "red")
# Quality of the variables on the factor map
#Cos2 value
head(var$cos2, 6)
#Visualise Cos Value
install.packages("corrplot")
library("corrplot")
corrplot(var$cos2, is.corr=FALSE)
# Bar plot of variables cos2 using the function fviz_cos2()[in factoextra]
# Total cos2 of variables on Dim.1 and Dim.2
fviz_cos2(res.pca, choice = "var", axes = 1:3)
# Color by cos2 values: quality on the factor map
fviz_pca_var(res.pca, col.var = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
             repel = TRUE)
             