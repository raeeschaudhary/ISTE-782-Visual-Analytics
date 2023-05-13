navbarPage("San Francisco - Airbnb",
           theme = shinytheme("united"),
           tabPanel(
             'Listing-Map',
             sidebarPanel(
               selectizeInput("neighbourhood","Neighbourhood", c('All', unique(airbnb$neighbourhood_cleansed))),
               selectInput("roomType", "Room Type", c('All', unique(airbnb$room_type))),
               sliderInput("price", "Filter Price", pre = "$",
                           min=1, max= 2500, value = c(1, 2500)),
               tags$h5("Size corresponds to number of reviews"),
             ),
             
             mainPanel(
               leafletOutput("SFmap", width = "100%",height="700px"),
               plotOutput("bar", click = "plot_click", hover = "plot_hover"),
               
             )
           ),
)