# PREP -----

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


# PLOT ----

ggplot() +
    geom_sf(data = maryland, fill = "white", color = "gray40") + # Plot the maryland borders
    geom_sf(data = df, aes(color=family), alpha = 0.3, size = 1) + # plot the BEEEEES
    theme_minimal() +
    labs(
        title = "Bee Observations Across Maryland",
        color = "Decade"
    )

df <- df %>%
  mutate(family_andrenidae = if_else(family == "Andrenidae", 1, 0)) %>%
  mutate(family_apidae = if_else(family == "Apidae", 1, 0)) %>%
  mutate(family_colletidae = if_else(family == "Colletidae", 1, 0)) %>%
  mutate(family_halictidae = if_else(family == "Halictidae", 1, 0)) %>%
  mutate(family_megachilidae = if_else(family == "Megachilidae", 1, 0)) %>%
  mutate(geom = st_jitter(geom))

family_scan_test <- function(df, family) {
  mycolumn <- paste0("family_", tolower(family))
  marks <- as.factor(df[[mycolumn]])
  pp <- ppp(
    x = bee_coords[,1],
    y = bee_coords[,2],
    window = md_window,
    marks = marks
  )

  scan <- spscan.test(pp, nsim=199, alpha=0.10, case="1")

  scan
}

# reused scan variables
md_window <- spatstat.geom::as.owin(maryland)
bee_coords <- st_coordinates(df)
families <- levels(df$family)

# Scans
scan_adren <- family_scan_test(df, families[1])
scan_ap <- family_scan_test(df, families[2])
scan_collet <- family_scan_test(df, families[3])
scan_halict <- family_scan_test(df, families[4])
scan_mega <- family_scan_test(df, families[5])

# Some helper functions
relabel_scans <- function(scan, familyname) {
  temp_scan <- scan
  temp_scan$ppp$marks <- factor(
    ifelse(scan$ppp$marks == "1", familyname, "Other"),
    levels = c(familyname, "Other")
  )

  temp_scan
}

relabel_and_plot <- function(scan, familyname) {
  newscan <- relabel_scans(scan, familyname)
  plot(
    newscan, 
    border="red", 
    pch = c(2, 3), 
    cols=c("blue", "black"),
    main="Spatial scan results"
  )
}

relabel_and_plot(scan_adren, families[1])
relabel_and_plot(scan_ap, families[2])
relabel_and_plot(scan_collet, families[3])
relabel_and_plot(scan_halict, families[4])
relabel_and_plot(scan_mega, families[5])
