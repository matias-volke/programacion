library(leaflet.minicharts)
library(dplyr)
library(leaflet)

tilesURL <- "http://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

basemap <- leaflet(width = "100%", height = "400px") %>%
  addTiles(tilesURL)

colors <- c("#4fc13c", "#cccccc")


basemap %>%
  addMinicharts(
    lng=-46.631, lat=-23.552,
    type = "polar-area" ,
    chartdata = c(3.04,4.21), 
    colorPalette = colors, transitionTime = 0, showLabels =TRUE)%>%
  addMinicharts(
    lng=-77.041, lat=-12.05,
    type = "bar",
    chartdata = c(100,200), 
    colorPalette = colors, transitionTime = 0, showLabels =TRUE)%>%
  addLabelOnlyMarkers(-46.631,-23.552, label =  "Sao Pablo", 
                      labelOptions = labelOptions(noHide = T, direction = 'top', textOnly = T))%>%
  addLabelOnlyMarkers(-46.631,-23.552, label =  c("2019: 100 \n 2020: 200"), 
                      labelOptions = labelOptions(noHide = T, direction = 'bottom', textOnly = F))

