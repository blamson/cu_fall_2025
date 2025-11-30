packages <- c(
  "spatstat", "pbapply", "smacpod", 
  "readr", "dplyr", "tidyr", "here", 
  "sf", "smerc", "spdep", "ggplot2", 
  "maps"
)

for (pkg in packages) {
  if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
    install.packages(pkg, repos = "https://cran.rstudio.com/")
    library(pkg, character.only = TRUE)
  }
}

# Load in data
df <- sf::read_sf("final-project/data/maryland_bee_decade_rs.gpkg") %>%
    mutate(decade = as.factor(decade))

# Maryland
maryland <- maps::map("state", region = "maryland", fill = TRUE, plot = FALSE)
maryland <- st_as_sf(maryland)
maryland <- st_set_crs(maryland, 4326)
maryland <- st_transform(maryland, 6487)

md_window <- spatstat.geom::as.owin(maryland)
bee_coords <- st_coordinates(df)
pp <- ppp(
  x = bee_coords[,1],
  y = bee_coords[,2],
  window = md_window,
  marks = df$decade
)

d00_qnn <- qnn.test(pp, q=seq(100,250,50), nsim=199, case="2000") # breakdown between q150 and q200
d10_qnn <- qnn.test(pp, q=seq(25,75,15), nsim=199, case="2010") #breakdown between q40 and q55
d20_qnn <- qnn.test(pp, q=seq(150,250,25), nsim=199, case="2020") #breakdown between q225 and q250


# SPATIAL SCAN TESTS
d00_scan <- spscan.test(pp, nsim=199, alpha=0.10, case="2000")
d10_scan <- spscan.test(pp, nsim=199, alpha=0.10, case="2010")
d20_scan <- spscan.test(pp, nsim=199, alpha=0.10, case="2020")

plot(
  d00_scan, 
  border="blue", 
  pch = c(2, 3, 4), 
  cols=c("blue", "black", "red"),
  main="Spatial scan results"
)

plot(
  d10_scan, 
  border="black", 
  pch = c(2, 3, 4), 
  cols=c("blue", "black", "red"),
  main="Spatial scan results",
  add=TRUE
)

plot(
  d20_scan, 
  border="red", 
  pch = c(2, 3, 4), 
  cols=c("blue", "black", "red"),
  main="Spatial scan results",
  add=TRUE
)
