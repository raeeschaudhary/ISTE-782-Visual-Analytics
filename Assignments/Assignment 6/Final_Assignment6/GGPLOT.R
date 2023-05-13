#install packages
install.packages('tidyverse')
install.packages('ggmap')

# Load packages
library(tidyverse)
library(ggmap)


airbnb <- read_csv(file = ("airbnb_sf_listings_clean.csv"))
#MAP Graph
sf <- get_stamenmap(bbox = c(left = -122.5164, bottom = 37.7066, right = -122.3554, top = 37.8103), maptype = c("toner-lines"), zoom = 13)
 ggmap(sf) + 
  + geom_point(data = airbnb, aes(x = longitude, y = latitude, color = price), alpha = 0.7) +
  + scale_colour_gradient(low = '#a4faff', high = '#0027fb') +
  + labs(title = "Prices by Location")


#Room type Prices
 airbnb %>% 
  + filter(accommodates <= 5) %>% 
  + group_by(room_type) %>% 
  + ggplot(aes(x = room_type, color = as.factor(accommodates))) +
  + geom_boxplot(aes(y = price)) + 
  + labs(title = "Room Type Price Comparison <= 5 Accommodate", x = "Room Type", y = "Price", color = "Room Type")

#Price comparison over neighbourhood
prices_neigh <- airbnb %>% 
  + group_by(neighbourhood_cleansed) %>%
  + mutate(avg_price = round(mean(price), 2))
 prices_neigh %>% 
  + select(neighbourhood_cleansed, avg_price) %>% 
  + group_by(neighbourhood_cleansed) %>% 
  + unique() %>% 
  + arrange(neighbourhood_cleansed, avg_price)
 prices_neigh %>% 
  + filter(accommodates <= 5) %>% 
  + ggplot(aes(x = as.factor(accommodates), y = fct_reorder(neighbourhood_cleansed, avg_price))) +
  + geom_tile(aes(fill = price)) + 
  + scale_fill_gradientn(colors = c("#c1e8ff", "#002b42")) +
  + labs(title = "Price vs Neighborhood Group and Accommodates",  x = "Accommodates", y = "Neighborhood Group")