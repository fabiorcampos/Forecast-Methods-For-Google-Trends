pageWithSidebar(
      headerPanel("Forecast Models tests in Google Trends"),
      sidebarPanel(
            textInput("search", label = "Search", value = "vehicles"),
            br(),
            selectInput("method", "Choose a forecast model:",
                        choices = c("Arithmetic Mean", 
                                    "Naive", "Seasonal Random Walk Method",
                                    "Random Walk with Drift Method")),
            br(),
            actionButton("goButton", "Go!")
      ),
      mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Plot", plotOutput("plot1")),
                        tabPanel("Summary", verbatimTextOutput("summary"))
            )
      )
)