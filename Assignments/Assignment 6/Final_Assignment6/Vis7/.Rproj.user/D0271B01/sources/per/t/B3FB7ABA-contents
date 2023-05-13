function(input, output, session) {
  
  output$SFmap <- renderLeaflet({
    row.names(airbnb_price) <- airbnb_price$neighbourhood_cleansed
    air_sub <- airbnb
    if (input$roomType != 'All'){
      air_sub <- subset(air_sub, (room_type == input$roomType))
    }
    
    if (input$neighbourhood != 'All'){
      air_sub <- subset(air_sub, (neighbourhood_cleansed == input$neighbourhood))
    }
    air_sub <- subset(air_sub, (price >= input$price[1]))
    air_sub <- subset(air_sub, (price <= input$price[2]))
    
    m <- leaflet() %>%
      
      addProviderTiles(provider = "Esri.WorldTopoMap") %>%
      setView(lat = 37.776264, lng = -122.445297, zoom = 12.4) %>%
      addCircleMarkers(data = air_sub, lng = ~longitude, lat = ~latitude,
                       color = 'orange',
                       fillColor = ~pal(reviews_per_month), fillOpacity = 1, 
                       radius = ~1.2*reviews_per_month,
                       popup = ~paste("<h5>", name, " listed by ", host_name, "</h5>",
                                      "<h6>", room_type, " in ", neighbourhood_cleansed, "</h6>",
                                      "$", price, " per night <br>",
                                      "Hosted Since ", host_since,"<br>", "<style> div.leaflet-popup-content-wrapper { opacity: 0.8; } </style>",sep = ""))
  })
  
}
