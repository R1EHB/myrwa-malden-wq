source("packages.R")

library(rgdal)
library(maptools)
library(rgeos)
library(ggmap)

old_wd <- getwd()
setwd("./data/gis")

layer_names <- c("malden_basin", "malden_hydro25k_poly", "malden_hydronet_arc", "malden_towns")

layers <- lapply(layer_names, function (layer) {
  x <- readOGR(dsn = ".", layer = layer)
  fortify(x)
})
names(layers) <- layer_names

setwd(old_wd)

map <- get_map(location = c(lon = -71.075, lat = 42.45), zoom = 12, maptype = "terrain")

ggmap(map, extent = "device") +
  geom_polygon(data = layers[["malden_towns"]], aes(x = long, y = lat, group = group),
               fill = NA, color = "black", linetype = 2) +
  geom_polygon(data = layers[["malden_basin"]], aes(x = long, y = lat, group = group),
               fill = NA, color = "red") +
  geom_path(data = layers[['malden_hydronet_arc']], aes(x = long, y = lat, group = group),
            color = "deepskyblue") +
  geom_polygon(data = layers[["malden_hydro25k_poly"]], aes(x = long, y = lat, group = group),
               fill = "deepskyblue", color = "steelblue")

out <- list(layers = layers,
            map = map)

saveRDS(out, "data/rdata/gis.rda")
