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

ggplot() +
    geom_sf(data = maryland, fill = "white", color = "gray40") + 
    geom_sf(data = df, aes(color=as.factor(decade)), alpha = 0.5, pch=23, size = 1.5) + 
    theme_minimal() +
    labs(
        title = "Bee Observations Across Maryland",
        color = "Decade"
    )