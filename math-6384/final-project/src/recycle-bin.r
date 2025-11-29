# For all my code that is unused but may be reused later ---

plot_scan_cluster <- function(scan, state, family_name = "Family") {

  # --- Extract points --------------------------------------------------------
  pp <- scan$ppp
  
  points_df <- tibble(
    x = pp$x,
    y = pp$y,
    mark = as.factor(pp$marks)
  )
  
  # --- Extract top cluster ----------------------------------------------------
  clus <- scan$clusters[[1]]
  
  cluster_df <- tibble(
    x0 = clus$coords[1],
    y0 = clus$coords[2],
    r  = clus$r
  )
  
  # --- Circle function --------------------------------------------------------
  circle_fun <- function(x0, y0, r, n = 360) {
    tibble(
      x = x0 + r * cos(seq(0, 2*pi, length.out = n)),
      y = y0 + r * sin(seq(0, 2*pi, length.out = n))
    )
  }
  
  circle_df <- circle_fun(cluster_df$x0, cluster_df$y0, cluster_df$r)

  # --- Build plot -------------------------------------------------------------
  ggplot() +
    geom_sf(data = state, fill = "white", color = "gray40") +
    geom_point(data = points_df,
               aes(x, y, color = mark),
               alpha = 0.7, size = 1.3) +
    geom_path(data = circle_df,
              aes(x, y),
              linewidth = 1.1,
              color = "red") +
    theme_minimal() +
    labs(x = "", y = "", title="Spatial scan results for bee families") +
    scale_color_discrete(
      name = "Family",
      labels = c(family_name, "Other")
    ) +
    theme(legend.position = "bottom")
}

plot_scan_cluster(scan_adren, state=maryland, family_name = families[1])
plot_scan_cluster(scan_ap, state=maryland, family_name = families[2])
plot_scan_cluster(scan_collet, state=maryland, family_name = families[3])
plot_scan_cluster(scan_halict, state=maryland, family_name = families[4])
plot_scan_cluster(scan_mega, state=maryland, family_name = families[5])





# GRADIENT CONTOUR PLOTS
# 2010s -----
file_path <- "final-project/data/d10-point-envelopes.rda"
if (!file.exists(file_path)) {
  d10_envelopes = logrr(pp, sigma = d10_sigma, case = "2010",
                  nsim = 499, level = 0.95)
  save(d10_envelopes, file = file_path)
}
load(file_path)

grad = gradient.color.scale(
    min(d10_envelopes$v, na.rm = TRUE),
    max(d10_envelopes$v, na.rm = TRUE)
)

plot(d10_envelopes, col = grad$col, breaks = grad$breaks, main="Tolerance envelope contour plot - 2010s vs other decades")
plot(md_window, add=TRUE)

# 2020s -------
file_path <- "final-project/data/d20-point-envelopes.rda"
if (!file.exists(file_path)) {
  d20_envelopes = logrr(pp, sigma = d20_sigma, case = "2020",
                  nsim = 499, level = 0.95)
  save(d20_envelopes, file = file_path)
}
load(file_path)

grad = gradient.color.scale(
    min(d20_envelopes$v, na.rm = TRUE),
    max(d20_envelopes$v, na.rm = TRUE)
)

plot(d20_envelopes, col = grad$col, breaks = grad$breaks, main="Tolerance envelope contour plot - 2020s vs other decades")
plot(md_window, add=TRUE)