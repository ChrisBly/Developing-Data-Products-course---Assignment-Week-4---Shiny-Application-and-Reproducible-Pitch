library(shiny)



shinyUI(fluidPage(
  titlePanel('New York Air Quality - the "Source: R dataset:	airquality' ),
  sidebarLayout(
    sidebarPanel(
      selectInput('ycol', 'Select a type of air quality values in relation to Air Quality Measurements in New York.
                  This will compare Ozone,to the air quality value you selected- .
                  ', names(airquality )[c(2,3,4)],
                  selected=names(airquality)[[1]]),
      h1(""),
      h5("head of dataset"),      
      tableOutput('table')      
    ),
    mainPanel(
      h4("The plots shows Daily air quality measurements in New York, May to September 1973"),
      h5("Note: This application uses Linear Regression which is a statistical methodology that helps estimate the strength and direction of the relationship between two or more variables"),
      h5("This applicaiton uses Linear Regression establishes a relationship between Ozone & the air quality value"),
      
      h5("There are three Tabs:"),
      h6(" Plot shows: Linear regression model to find relationship of Ozone &
         one of the air quality value you selected ."),
      h6("Summary: Is the data summary of the airquality Dataset "),
      h6("Pairs: Is the The relationships between air quality values"),
      tabsetPanel(
        tabPanel("Plot", plotOutput("plot1")),
        tabPanel("Summary", verbatimTextOutput("summary")),
        tabPanel("The relationships between pairs of variables.",plotOutput("pairs"))
        
      )
        
    )
  )
))
