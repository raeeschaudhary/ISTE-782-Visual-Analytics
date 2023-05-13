#install.packages('shiny'); 
library(shiny)
#install.packages("plotly"); 
library(plotly)
#install.packages(shinythemes); 
library(shinythemes)

airbnb1 <- read.csv("listings.csv")
airbnb <- read.csv("listings_2.csv")
airbnb_all <- merge(x = airbnb1, y = airbnb, by = "id", all.x = TRUE)

colnames(airbnb)
airbnb$price <- gsub("$", "", airbnb$price)
airbnb$price <- tidyr::extract_numeric(airbnb$price)
airbnb <- airbnb[-c(6776), ]
airbnb <- airbnb[airbnb$price < 1000, ]

summary(airbnb$price)
airbnb_price <- aggregate(price ~ neighbourhood_cleansed, data = airbnb, FUN = mean)
airbnb_price$type <- 'Neighborhood'