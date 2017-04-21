library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("KBRIN 2017 Example: Data Viewer!"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      shiny::selectInput("dataset","Select Data Set",choices = data()$results[, "Item"][c(4,5,6,14:15,17,19:29)])
    ),
    
    # Show a plot of the generated distribution
  mainPanel(
    tabsetPanel(
      tabPanel("Data Table",dataTableOutput(outputId="dataTableOut")),
      tabPanel("Scatterplot/BoxPlot",
               uiOutput(outputId="xvarOut"),
               uiOutput(outputId="yvarOut"),
               plotOutput("plotOutput")
      
    )
  )  
)
  )
))