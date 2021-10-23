library(shinyWidgets)
library(shiny)
library(shinyWidgets)
library(shiny)
library(plotly)
library(shinythemes)
library(DT)
library(rsconnect)


ui <- navbarPage(
  "HEALTH_R10: Health Systems",
  theme = "style.css",
  tabPanel(
    "Main",
    # App title ----
    titlePanel(div(
      windowTitle = "Health Systems",
      img(src = "banner.jpg", width = "100%", class = "bg"),
    )),
    
    tags$br(),
    
    ##########################################
    ####  Panel: Home            ####
    ##########################################
    
    tabsetPanel(
      type = "tabs",
      tabPanel(
        "Global Summary",
        
        sidebarLayout(
          sidebarPanel(
            h3("Data By Month"),
            tags$br(),
            selectInput(
              "checkMonth",
              "Select Month",
              choices = list("Jan", "Feb", "March",
                             "April", "May", "June")
            )
          ),
          
          mainPanel(
            tabsetPanel(
              type = "tabs",
              tabPanel("Placeholder 1"),
              tabPanel("Placeholder 2"),
              tabPanel("Placeholder 3")
            ),
            tags$br(),
            tags$br(),
          )
        ),
        
        tags$hr(),
      ),
      
      ################################################
      #### Panel: Public Health Responses         ####
      ################################################
      
      tabPanel(
        "Public Health Response",
        
        sidebarLayout(
          sidebarPanel(
            h3("Data By Month"),
            tags$br(),
            selectInput(
              "checkMonth",
              "Select Month",
              choices = list("Jan", "Feb", "March",
                             "April", "May", "June")
            )
          ),
          
          mainPanel(
            tabsetPanel(
              type = "tabs",
              tabPanel("Placeholder 1"),
              tabPanel("Placeholder 2"),
              tabPanel("Placeholder 3")
            ),
            tags$br(),
            tags$br(),
          )
        ),
        
        tags$hr(),
      ),
      
      ################################################
      #### Panel: Testing                         ####
      ################################################
      
      tabPanel(
        "Testing",
        
      tabsetPanel(
        tabPanel("COVID-19 Testing Policy", fluid = TRUE,
                 sidebarLayout(
                   sidebarPanel(dateInput("date", "Date:", value = "2020-05-05",datesdisabled = c("2020-01-01", "2022-01-01"))),
                   mainPanel(
                     plotlyOutput("policies")
                   )
                 )
        ),
        tabPanel("Daily COVID-19 test", fluid = TRUE,
                 sidebarLayout(
                   sidebarPanel(selectInput("countries", "Countries/Regions:",
                                            choices = unique(new_test$Entity),
                                            multiple = TRUE,
                                            selected = "Australia")
                   ),
                   mainPanel(
                     plotlyOutput(outputId = "new_tests_plot")
                   )
                 )
        ),
        tabPanel("Forcasting new test", fluid = TRUE,
                 sidebarLayout(
                   sidebarPanel(selectInput("country", "Countries/Regions:",
                                            choices = unique(new_test$Entity),
                                            multiple = FALSE,
                                            selected = "Australia")
                   ),
                   mainPanel(
                     plotOutput(outputId = "forcast_test_plot")
                   )
                 )
        )
      )
      ),
      
      
      ################################################
      #### Panel: Vaccinations                    ####
      ################################################
      
      tabPanel(
        "Vaccinations",
        
        sidebarLayout(
          sidebarPanel(
            h3("Data By Month"),
            tags$br(),
            selectInput(
              "checkMonth",
              "Select Month",
              choices = list("Jan", "Feb", "March",
                             "April", "May", "June")
            )
          ),
          
          mainPanel(
            tabsetPanel(
              type = "tabs",
              tabPanel("Placeholder 1"),
              tabPanel("Placeholder 2"),
              tabPanel("Placeholder 3")
            ),
            tags$br(),
            tags$br(),
          )
        ),
        
        tags$hr(),
      ),
      
      ################################################
      #### Panel: Summary                         ####
      ################################################
      
      tabPanel(
        "Summary",
        
        sidebarLayout(
          sidebarPanel(
            h3("Data By Month"),
            tags$br(),
            selectInput(
              "checkMonth",
              "Select Month",
              choices = list("Jan", "Feb", "March",
                             "April", "May", "June")
            )
          ),
          
          mainPanel(
            tabsetPanel(
              type = "tabs",
              tabPanel("Placeholder 1"),
              tabPanel("Placeholder 2"),
              tabPanel("Placeholder 3")
            ),
            tags$br(),
            tags$br(),
          )
        ),
        
        tags$hr(),
      )
    )
  ),
  

  ################################################
  #### Panel: Documentation                   ####
  ################################################
  
  tabPanel("Documentation",
           fluidPage(htmlOutput("doc"))),
  
  ################################################
  #### Panel: About                           ####
  ################################################
  tabPanel("About",
           fluidPage(htmlOutput("abo"))),
 

  
  # Changes colour of header navbar
  tags$head(
    tags$style(type = 'text/css', 
               HTML('.navbar { background-color: #fb6c2e;}
                          .navbar-default .navbar-brand{color: white;}
                          .tab-panel{ background-color: green; color: black}
                          .navbar-default .navbar-nav > .active > a, 
                           .navbar-default .navbar-nav > .active > a:focus, 
                           .navbar-default .navbar-nav > .active > a:hover {
                                color: white;
                                background-color: orange;
                            }
                    a:link {color: orange;}')
    )),
  
  # Change colour of back ground
  setBackgroundColor(
    #color = c("#F1F1F1", "#EA6A47"),
    color = "white",
    gradient = "linear",
    direction = "bottom"
    
  )
)