library(gtrendsR)
library(forecast)
library(tseries)

function(input, output) {
      
      ntext <- eventReactive(input$goButton, {
            input$search
            
            if (input$goButton == 0)
                  return()
            
      })
      
      modelInput <- eventReactive(input$goButton, {
            switch(input$method,
                   "Arithmetic Mean" = meanf,
                   "Naive" = naive,
                   "Seasonal Random Walk Method" = snaive,
                   "Random Walk Method" = rwf,
                   ignoreNULL = FALSE)
            
      })
      
      output$plot1 <- renderPlot({
            gt.us <- gtrends(keyword = input$search)
            gt.fc <- gt.us$interest_over_time
            xt <- window(gt.fc[,2], end = 200)
            p1 <- modelInput()(xt, h = 60)
            plot(p1, ylab = "Hits", xlab = "Time series (2004 - 2017)", col = "red", ylim = c(-30, 100))
            lines(gt.fc[,2])
      })
      
      output$summary <- renderPrint({
            gt.us <- gtrends(keyword = input$search)
            gt.fc <- gt.us$interest_over_time
            xt <- window(gt.fc[,2], end = 200)
            p1 <- modelInput()(xt, h = 60)
            accuracy(p1)
      })
}