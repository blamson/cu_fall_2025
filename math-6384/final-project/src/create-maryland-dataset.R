library(readr)
library(dplyr)
library(sf)
library(smerc)
library(spdep)
library(ggplot2)
library(maps)

path <- "final-project/data/full_bee_dataset.csv"
df <- readr::read_delim(path, delim="\t")

bee_families <- c("Andrenidae", "Apidae", "Colletidae", "Halictidae", "Megachilidae", "Melittidae")

df_slim <- df %>%
    select(
        c(
            "gbifID", "occurrenceID", "family", "scientificName", 
            "countryCode", "locality", "stateProvince", "individualCount", 
            "decimalLatitude", "decimalLongitude", 
            "eventDate", "day", "month", "year", "dateIdentified",
            "basisOfRecord", "institutionCode", "collectionCode"
        )
    ) %>% 
    tidyr::drop_na("decimalLongitude") %>% 
    filter(countryCode == "US") %>%
    filter(family %in% bee_families)

maryland_df <- df_slim %>% 
    filter(stateProvince == "Maryland") %>%
    mutate(decade = floor(year / 10) * 10 ) %>%
    filter(decade >= 2000)

View(maryland_df %>% group_by(decade) %>% count() %>% arrange(desc(n)))




# Generate map of data ---
# Convert maryland long/lat to proper coordinates
sf_bees <- st_as_sf(maryland_df, coords = c("decimalLongitude", "decimalLatitude"))
maryland <- st_as_sf(maps::map("state", region=c('maryland'), plot = FALSE, fill = TRUE))

st_intersection(sf_bees, maryland)

ggplot() +
    geom_sf(data = maryland, fill = "white", color = "gray40") + # Plot the maryland borders
    geom_sf(data = sf_bees, aes(color=as.factor(decade)), alpha = 0.7, size = 1) + # plot the BEEEEES
    theme_minimal() +
    labs(title = "Bee Observations Across the U.S.")

# readr::write_csv(maryland_df, "final-project/data/maryland_bees.csv")
