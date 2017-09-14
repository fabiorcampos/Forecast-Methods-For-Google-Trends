shinythemes::shinytheme("sandstone")
pageWithSidebar(
      headerPanel("Forecast Models tests in Google Trends"),
      sidebarPanel(
            textInput("search", "Search query:", value = "Type a search"),
            br(),
            selectInput("method", "Choose a forecast model:",
                        choices = c("Arithmetic Mean", 
                                    "Naive", "Seasonal Random Walk Method",
                                    "Random Walk Method"
                                    )),
            br(),
            actionButton("goButton", label = "Run Code!"),
            br(),
            br(),
            br(),
            p(strong("Get Started"), align = "center"),
            p("1) Select a term to search in Google Trends", align = "center"),
            p("2) Select the Forecast Method", align = "center"),
            p("3) Click on 'Run Code'! and wait few seconds to load the data", align = "center")
      ),
      mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Plots", plotOutput("plot1"),
                                 h4("See the Manual at: https://github.com/fabiorcampos/Forecast-Methods-For-Google-Trends")
                                 ),
                        tabPanel("Summary", verbatimTextOutput("summary"),
                                 br(),
                                 p("The measures calculated are:"),
                                 p("ME: Mean Error"),
                                 p("RMSE: Root Mean Squared Error"),
                                 p("MAE: Mean Absolute Error"),
                                 p("MAPE: Mean Abslute Percentage Error"),
                                 p("MASE: Mean Absolute Scaled Error"),
                                 p("ACF1: Autocorrelation of errors at lag 1"),
                                 p("See Hyndman and Koehler (2006) and Hyndman and Athanasopoulos (2014, Section 2.5) for further details")),
                        tabPanel("Readme",
                                 br(),
                                 p("This shiny application is for testing some simple forecasting models. We used the Google Trends database for this application using the 'gtrendsR' package."),
                                 p("Instruction: To use this application, enter a keyword that interests you, select the forecast template and click on 'Run Code'."),
                                 p("Hyndman, R.J. and Athanasopoulos, G. (2013) Forecasting: principles and practice. OTexts: Melbourne, Australia. http://otexts.org/fpp/."))
                                 )
      )
)