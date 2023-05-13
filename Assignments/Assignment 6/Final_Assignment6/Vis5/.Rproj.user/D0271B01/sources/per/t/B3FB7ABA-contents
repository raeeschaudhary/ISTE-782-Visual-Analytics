function(input, output, session) {
  
  #render bar plot
  output$bar_plot <- renderPlot({
    air_select <- airbnb
    neighborhood_list <- c(input$bar_neighborhood1, input$bar_neighborhood2, input$bar_neighborhood3, input$bar_neighborhood4, input$bar_neighborhood5)
    air_select <- airbnb[airbnb$neighbourhood_cleansed %in% neighborhood_list,]
    
    ggplot(air_select %>% filter(price >= input$price[1] & price <= input$price[2]), aes(neighbourhood_cleansed)) + 
      geom_bar(aes(fill=room_type), position = position_dodge())
  })
  
  # Render Bar plot
  output$bar <- renderPlot({
    neighborhood_list <- c(input$bar_neighborhood1, input$bar_neighborhood2, input$bar_neighborhood3, input$bar_neighborhood4, input$bar_neighborhood5)
    air_select <- airbnb[airbnb$neighbourhood_cleansed %in% neighborhood_list,]
    air_select <- subset(air_select, (price >= input$price[1]))
    air_select <- subset(air_select, (price <= input$price[2]))
    
    
    myData <- aggregate( . ~ neighbourhood_cleansed,data = air_select[, c(input$orderby, 'neighbourhood_cleansed')], FUN = function(x) c(mean = mean(x), sd = sd(x),n = length(x)))
    myData <- do.call(data.frame, myData)
    names(myData) <- c('Neighborhood', 'mean', 'sd', 'n')
    myData$se <- myData$sd / sqrt(myData$n)
    myData <- myData[with(myData, order(mean)), ]
    myData <- head(myData,10)
    
    dodge <- position_dodge(width = 0.9)
    limits <- aes(ymax = myData$mean + myData$se,
                  ymin = myData$mean - myData$se)
    
    order_price <- myData$Neighborhood
    ggplot(data = myData, aes(x = Neighborhood, y = mean)) +geom_bar(stat = "identity", position = dodge, fill = "dodgerblue3") +
      geom_errorbar(limits, position = dodge, width = 0.25) +
      scale_x_discrete(limits = order_price) + coord_flip() + xlab("Neighborhood") + ylab("Average") + theme(text = element_text(size=20))
  })
  
}
