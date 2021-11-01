install.packages(c("FactoMineR", "factoextra"))
install.packages("ggplot2")
library("FactoMineR")
library("factoextra")
library("ggplot2")
hawk <- read.csv("HAWK MOTH PCA.csv",row.names = 1)
hawk
hawk_data <- hawk[,1:3]
hawk_data
PCA(hawk_data, scale.unit = TRUE, ncp = 5, graph = TRUE)
library("FactoMineR")
res.pca <- PCA(na.omit(hawk_data), graph = FALSE)
print(res.pca)
eig.val <- get_eigenvalue(res.pca)
eig.val
library("factoextra")
fviz_eig(res.pca, choice = "eigenvalue", addlabels=TRUE)
install.packages("stringi")
library(stringi)
fviz_pca_var(res.pca, col.var = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
             repel = TRUE)
fviz_pca_var(res.pca, col.var = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
             repel = TRUE)
fviz_pca_biplot(res.pca, geom.ind = "point",fill.ind = res$Subfamily, col.ind = "black",pointshape = 21, pointsize = 2,palette = "jco",addEllipses = TRUE,alpha.var ="contrib", col.var = "contrib",gradient.cols = "RdYlBu",legend.title = list(fill = "Subfamily", color = "Contrib",alpha = "Contrib"))
ind.p <- fviz_pca_ind(res.pca, geom = "point", col.ind = res$Subfamily)
ggpubr::ggpar(ind.p,
              title = "Principal Component Analysis",
              subtitle = "Iris data set",
              caption = "Source: factoextra",
              xlab = "PC1", ylab = "PC2",
              legend.title = "Species", legend.position = "top",
              ggtheme = theme_gray(), palette = "jco"
)
 