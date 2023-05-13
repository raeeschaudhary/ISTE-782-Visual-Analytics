navbarPage("San Francisco - Airbnb",
           theme = shinytheme("united"),
           tabPanel(
             'Listing Comparison',
             sidebarPanel(
               tags$h4("Select any five neighbourhoods to compare"),
               selectInput("bar_neighborhood1", "Choice 1", unique(airbnb$neighbourhood_cleansed), selected = 'Mission'),
               selectInput("bar_neighborhood2", "Choice 2", unique(airbnb$neighbourhood_cleansed), selected = 'Bayview'),
               selectInput("bar_neighborhood3", "Choice 3", unique(airbnb$neighbourhood_cleansed), selected = 'Inner Richmond'),
               selectInput("bar_neighborhood4", "Choice 4", unique(airbnb$neighbourhood_cleansed), selected = 'Marina'),
               selectInput("bar_neighborhood5", "Choice 5", unique(airbnb$neighbourhood_cleansed), selected = 'Glen Park'),
               selectInput("orderby", "Parameter to compare", c('Average Price' = 'price', "Number of Reviews"="number_of_reviews", "Month availability" = 'availability_30')),
               sliderInput("price",
                           "Filter by Price", pre = "$",
                           min=1, max= 2500, value = c(1, 2500)),
               
             ),
             
             mainPanel(
               tags$h4("Listings of Room Types for Neighbourhoods"),
               plotOutput('bar_plot'),
               tags$h4("Score (Parameter) comparison for Neighbourhoods"),
               plotOutput("bar", click = "plot_click", hover = "plot_hover"),
               
             )
           ),
           
)