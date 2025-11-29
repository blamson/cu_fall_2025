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

# Contour Plots ---

md_window <- spatstat.geom::as.owin(maryland)
bee_coords <- st_coordinates(df)
# decades <- levels(df$decade)
# marks <- decades
pp <- ppp(
  x = bee_coords[,1],
  y = bee_coords[,2],
  window = md_window,
  marks = df$decade
)

d00 <- which(pp$marks == "2000")
d10 <- which(pp$marks == "2010")
d20 <- which(pp$marks == "2020")
d00_sigma <- bw.scott(pp[d00, ], isotropic = TRUE)
d10_sigma <- bw.scott(pp[d10, ], isotropic = TRUE)
d20_sigma <- bw.scott(pp[d20, ], isotropic = TRUE)

density_00 <- spdensity(pp[d00, ], sigma = d00_sigma)
density_10 <- spdensity(pp[d10, ], sigma = d10_sigma)
density_20 <- spdensity(pp[d20, ], sigma = d20_sigma)

plot(md_window, main="2000s"); contour(density_00, add=TRUE)
plot(md_window, main="2010s"); contour(density_10, add=TRUE)
plot(md_window, main="2020s"); contour(density_20, add=TRUE)

# Gradient contour plots

# 2000s vs 2010 -------
file_path <- "final-project/data/d00-d10-point-envelopes.rda"
if (!file.exists(file_path)) {
  obs <- which(pp$marks %in% c("2000", "2010"))
  sigma <- mean(c(d00_sigma, d10_sigma))
  d00_d10_envelopes = logrr(pp[obs, ], sigma = sigma, case = "2000",
                  nsim = 499, level = 0.95)
  save(d00_d10_envelopes, file = file_path)
}
load(file_path)

grad = gradient.color.scale(
    min(d00_d10_envelopes$v, na.rm = TRUE),
    max(d00_d10_envelopes$v, na.rm = TRUE)
)

plot(d00_d10_envelopes, col = grad$col, breaks = grad$breaks, main="Tolerance envelope contour plot - 2000s vs 2010s")
plot(md_window, add=TRUE)


# 2000s vs 2020s --------
file_path <- "final-project/data/d00-d20-point-envelopes.rda"
if (!file.exists(file_path)) {
  obs <- which(pp$marks %in% c("2000", "2020"))
  sigma <- mean(c(d00_sigma, d20_sigma))
  d00_d20_envelopes = logrr(pp[obs, ], sigma = sigma, case = "2000",
                  nsim = 499, level = 0.95)
  save(d00_d20_envelopes, file = file_path)
}
load(file_path)

grad = gradient.color.scale(
    min(d00_d20_envelopes$v, na.rm = TRUE),
    max(d00_d20_envelopes$v, na.rm = TRUE)
)

plot(d00_d20_envelopes, col = grad$col, breaks = grad$breaks, main="Tolerance envelope contour plot - 2000s vs 2020s")
plot(md_window, add=TRUE)


# 2010s vs 2020s ------
file_path <- "final-project/data/d10-d20-point-envelopes.rda"
if (!file.exists(file_path)) {
  obs <- which(pp$marks %in% c("2010", "2020"))
  sigma <- mean(c(d10_sigma, d20_sigma))
  d10_d20_envelopes = logrr(pp[obs, ], sigma = sigma, case = "2010",
                  nsim = 499, level = 0.95)
  save(d10_d20_envelopes, file = file_path)
}
load(file_path)

grad = gradient.color.scale(
    min(d10_d20_envelopes$v, na.rm = TRUE),
    max(d10_d20_envelopes$v, na.rm = TRUE)
)

plot(d10_d20_envelopes, col = grad$col, breaks = grad$breaks, main="Tolerance envelope contour plot - 2010s vs 2020s")
plot(md_window, add=TRUE)


# DIFFERENCE IN K-VALUES ---

# 2000s vs 2010s
file_path <- "final-project/data/d00-d10-kdenv.rda"
if (!file.exists(file_path)) {
  obs <- which(pp$marks %in% c("2000", "2010"))
  d00_d10_kdenv = kdest(pp[obs, ], case = "2000", nsim = 199, level = 0.95)
  save(d00_d10_kdenv, file = file_path)
}
load(file_path)

plot(d00_d10_kdenv, ylab = "difference in K functions", legend=F, main="2000s vs 2010s")
legend("topleft", legend = c("obs", "avg", "max/min env", "95% env"),
       lty = c(1, 2, 1, 2), col = c("black", "red", "darkgrey", "lightgrey"),
       lwd = c(1, 1, 10, 10))

kdplus.test(d00_d10_kdenv)

# 2000s vs 2020s
file_path <- "final-project/data/d00-d20-kdenv.rda"
if (!file.exists(file_path)) {
  obs <- which(pp$marks %in% c("2000", "2020"))
  d00_d20_kdenv = kdest(pp[obs, ], case = "2000", nsim = 199, level = 0.95)
  save(d00_d20_kdenv, file = file_path)
}
load(file_path)

plot(d00_d20_kdenv, ylab = "difference in K functions", legend=F, main="2000s vs 2020s")
legend("topleft", legend = c("obs", "avg", "max/min env", "95% env"),
       lty = c(1, 2, 1, 2), col = c("black", "red", "darkgrey", "lightgrey"),
       lwd = c(1, 1, 10, 10))

kdplus.test(d00_d20_kdenv)

# 2010s vs 2020s
file_path <- "final-project/data/d10-d20-kdenv.rda"
if (!file.exists(file_path)) {
  obs <- which(pp$marks %in% c("2010", "2020"))
  d10_d20_kdenv = kdest(pp[obs, ], case = "2010", nsim = 199, level = 0.95)
  save(d10_d20_kdenv, file = file_path)
}
load(file_path)

plot(d10_d20_kdenv, ylab = "difference in K functions", legend=F, main="2010s vs 2020s")
legend("topleft", legend = c("obs", "avg", "max/min env", "95% env"),
       lty = c(1, 2, 1, 2), col = c("black", "red", "darkgrey", "lightgrey"),
       lwd = c(1, 1, 10, 10))

kdplus.test(d10_d20_kdenv)