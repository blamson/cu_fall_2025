# PREP WORK ----

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

df <- sf::read_sf("final-project/data/maryland_bee_sample.gpkg") %>%
    mutate(decade = as.factor(decade)) %>%
    mutate(year = as.factor(year)) %>%
    mutate(family = as.factor(family))

maryland <- maps::map("state", region = "maryland", fill = TRUE, plot = FALSE)
maryland <- st_as_sf(maryland)
maryland <- st_set_crs(maryland, 4326)
maryland <- st_transform(maryland, 6487)

df <- df %>%
  mutate(family_andrenidae = if_else(family == "Andrenidae", 1, 0)) %>%
  mutate(family_apidae = if_else(family == "Apidae", 1, 0)) %>%
  # mutate(family_colletidae = if_else(family == "Colletidae", 1, 0)) %>%
  mutate(family_halictidae = if_else(family == "Halictidae", 1, 0)) %>%
  # mutate(family_megachilidae = if_else(family == "Megachilidae", 1, 0)) %>%
  mutate(geom = st_jitter(geom))

# QNN TESTING

family_qnn_test <- function(df, family) {
  mycolumn <- paste0("family_", tolower(family))
  marks <- as.factor(df[[mycolumn]])
  pp <- ppp(
    x = bee_coords[,1],
    y = bee_coords[,2],
    window = md_window,
    marks = marks
  )

  qres <- qnn.test(
    pp,
    q=seq(20,50,5), 
    nsim=199,
    case="1"
  )

  qres
}

# reused scan variables
md_window <- spatstat.geom::as.owin(maryland)
bee_coords <- st_coordinates(df)
families <- levels(df$family)

qnn_adren <- family_qnn_test(df, families[1])
qnn_ap <- family_qnn_test(df, families[2])
qnn_halict <- family_qnn_test(df, families[3])

print(paste("QNN RESULTS: ", families[1]))
print(qnn_adren)
print(paste("QNN RESULTS: ", families[2]))
print(qnn_ap)
print(paste("QNN RESULTS: ", families[3]))
print(qnn_halict)
