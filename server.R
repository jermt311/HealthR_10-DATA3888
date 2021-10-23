##########################################
####   Main Libraries                 ####
##########################################
library(shiny)
library(ggplot2)
library(dplyr)
library(tidyr)
library(DT)
library(knitr)
library(kableExtra)
library(ggthemes)
library(plotly)

library(rsconnect)
library(shinythemes)

##########################################
####   Attaching datasets             ####
##########################################




##########################################
####   Shiny server                   ####
##########################################

server <- function(session, input, output) {
  
  output$policies <- renderPlotly({
    date = input$date

    policy = policy%>%filter(Day==date)

    options(scipen=999)
    world_map_with_data <- merge(world_map, policy,
                                 by.x = "region", by.y = "Entity",
                                 all.x = TRUE)
    world_map_with_data <- world_map_with_data[order(world_map_with_data$order), ]
    
    worldmap2 = ggplot(data=world_map_with_data, aes(x=long, y=lat, group=group, fill=testing_policy, label=region, testing_policy=testing_policy)) + geom_polygon() + theme(aspect.ratio=0.6) + ggtitle("Covid19_testing policy") + labs(fill="testing_policy")
    plotly::ggplotly(worldmap2, tooltip=c("region", "testing_policy"))
  })
  
  output$new_tests_plot <- renderPlotly({
    # new_test = read.csv("data/testing.csv")
    countries = input$countries
    # countries_list = unique(new_test$Entity)
    new_test$Day <- as.Date(new_test$Day)
    test_country <- new_test%>%filter(new_test$Entity%in% countries)
    ggplot(test_country, aes(x = Day, y = new_tests_7day_smoothed, 
                                       group = Entity, color = Entity)) +
      geom_line(lwd = 1) +
      theme_bw() +
      scale_color_tableau(palette = "Tableau 20") +
      ylab("number of new tests") +
      labs(title = "Daily covid 19 tests", color = "Country/Region")
    
  })
  
  output$forcast_test_plot <- renderPlot({
    country = input$country
    oz_data <- data %>% 
      dplyr::filter(Entity == country)
    oz_data = oz_data%>%select(-Entity)
    data_ts= ts(oz_data$new_tests_7day_smoothed,start = c(2020,3), end = c(2021,5), frequency = 365)
    fit_A <- auto.arima(data_ts)
    plot(forecast(fit_A, 100))

  })
  
  ################################################
  #### Panel: Documentation                   ####
  ################################################
  
  getPageDoc <- function() {
    return(includeHTML("documentation.html"))
  }
  output$doc <- renderUI({
    getPageDoc()
  })
  
  ################################################
  #### Panel: About                           ####
  ################################################
  
  getPageAbo <- function() {
    return(includeHTML("about.html"))
  }
  output$abo <- renderUI({
    getPageAbo()
  })
  
}
