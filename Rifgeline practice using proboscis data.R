
install.packages("ggplot2")
library(ggplot2)
install.packages("ggridges")
library(ggridges)

data <- data.frame(x = 1:5, y = rep(1, 5), height = c(0, 1, 3, 4, 2))

proboscis <- read.csv("proboscis.csv")
proboscis
# Opened polygons
ggplot(proboscis, aes(x = sbe.length, y = y, group = y)) + 
  geom_density_ridges(fill = "#00AFBB")
# Closed polygons
ggplot(proboscis, aes(x = sbe.diametre, y = y, group = y)) + 
  geom_density_ridges2(fill = "#00AFBB")
# Cut off the trailin tails. 
# Specify `rel_min_height`: a percent cutoff
ggplot(proboscis, aes(x = sbe.length, y = y)) + 
  geom_density_ridges(fill = "#00AFBB", rel_min_height = 0.01)
# scale = 0.6, not touching
ggplot(proboscis, aes(x = sbe.diametre, y = y)) + 
  geom_density_ridges(scale = 0.6)
#scale = 1, exactly touching
ggplot(proboscis, aes(x = sbe.diametre, y = y)) + 
  geom_density_ridges(scale = 1)
# scale = 5, substantial overlap
ggplot(proboscis, aes(x = sbe.diametre, y = y)) +
  geom_density_ridges(scale = 5, alpha = 0.7)
# Change the density area fill colors by groups
ggplot(proboscis, aes(x = sbe.length, y = y)) +
  geom_density_ridges(aes(fill = y)) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800", "#FC4E07")) +
  theme(legend.position = "none")
#visualize Lincoln Dataset
ggplot(
  lincoln_weather, 
  aes(x = `Mean Temperature [F]`, y = `Month`, fill = stat(x))
) +
  geom_density_ridges_gradient(scale = 3, size = 0.3, rel_min_height = 0.01) +
  scale_fill_viridis_c(name = "Temp. [F]", option = "C") +
  labs(title = 'Temperatures in Lincoln_plot_testing_Rajesh') 
#visualize Proboscis dataset Sbe.length with species
data("lincoln_weather")
ggplot(
  proboscis, 
  aes(x = `sbe.length`, y = `y`, fill = stat(x))
) +
  geom_density_ridges_gradient(scale = 3, size = 0.3, rel_min_height = 0.01) +
  scale_fill_viridis_c(name = "sbe.length [um]", option = "C") +
  labs(title = 'Length of sensilla in Moth families')
# Color by quantiles
ggplot(proboscis, aes(x = sbe.diametre, y = y, fill = factor(stat(quantile)))) +
  stat_density_ridges(
    geom = "density_ridges_gradient", calc_ecdf = TRUE,
    quantiles = 4, quantile_lines = TRUE
  ) +
  scale_fill_viridis_d(name = "Quartiles")
# Tail probability
ggplot(proboscis, aes(x = sbe.length, y = y, fill = 0.5 - abs(0.5 - stat(ecdf)))) +
  stat_density_ridges(geom = "density_ridges_gradient", calc_ecdf = TRUE) +
  scale_fill_viridis_c(name = "Tail probability", direction = -1)
# Add jittered points
ggplot(proboscis, aes(x = sbe.length, y = y)) +
  geom_density_ridges(jittered_points = TRUE)    
# Control the position of points
# position = "raincloud"
ggplot(proboscis, aes(x = sbe.length, y = y)) +
  geom_density_ridges(
    jittered_points = TRUE, position = "raincloud",
    alpha = 0.7, scale = 0.9
  )

# position = "points_jitter"
ggplot(proboscis, aes(x = sbe.length, y = y)) +
  geom_density_ridges(
    jittered_points = TRUE, position = "points_jitter",
    alpha = 0.7, scale = 0.9
  )

# Add marginal rug
ggplot(proboscis, aes(x = sbe.length, y = y)) +
  geom_density_ridges(
    jittered_points = TRUE,
    position = position_points_jitter(width = 0.05, height = 0),
    point_shape = '|', point_size = 3, point_alpha = 1, alpha = 0.7,
  )
# Styling jittered points
ggplot(proboscis, aes(x = sbe.length, y = y, fill = y)) +
  geom_density_ridges(
    aes(point_color = y, point_fill = y, point_shape = y),
    alpha = .2, point_alpha = 1, jittered_points = TRUE
  ) +
  scale_point_color_hue(l = 40) +
  scale_discrete_manual(aesthetics = "point_shape", values = c(21, 22, 23))
# Histogram distribution
ggplot(proboscis, aes(x = sbe.length, y = y, height = stat(density))) + 
  geom_density_ridges(
    stat = "binline", bins = 20, scale = 0.95,
    draw_baseline = FALSE
  )