#Loading Packges

library(shiny)
library(datasets)
#Loading Dataset - airquality
data(airquality)
# - Removing NA valuyes.
airquality <-na.omit(airquality)

shinyServer(function(input, output) {
# Selecting the LM model using a widget input.  
  selectedData <- reactive({
    airquality[, c("Ozone", input$ycol)]
  })
 #LM models
  model1 <- lm(Ozone ~ Solar.R, data = airquality)
  model2 <- lm(Ozone ~ Wind, data = airquality)
  model3 <- lm(Ozone ~ Temp, data = airquality)
  
  #Tab: Plot
  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData())
    #LM Model sections
    if(input$ycol=='Solar.R'){abline(model1, col = "blue", lwd = 2)}
    if(input$ycol=='Wind'){abline(model2, col = "green", lwd = 2)}
    if(input$ycol=='Temp'){abline(model3, col = "red", lwd = 2)}
    })
  #Tab: Summary - Generate a summary of the data
  output$summary <- renderPrint({
    summary(airquality)
  })
  #Tab: Pairs- Generate a pairs
  output$pairs <- renderPlot({
  pairs(airquality, panel = panel.smooth, main = "airquality data")
    
  })
  #head of dataset
   output$table <- renderTable({
   head(selectedData(),10)
  })
  
  
  
  
  
  
})
