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