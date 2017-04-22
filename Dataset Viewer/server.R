library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {
  getdataset<-reactive({
    eval(parse(text=paste("data.frame(datasets::",input$dataset,")",collapse="")))
  })
  
  output$plotOutput<-renderPlot({
   #plot(x=1:100,y=rnorm(100))
   dat<-getdataset()
   xv<-dat[,input$xvar]
   yv<-dat[,input$yvar]
   show(yv)
   
   plot(x=xv,y=yv,main="test",xlab=input$xvar,ylab=input$yvar,pch=20)
})
 
 
 output$dataTableOut<-shiny::renderDataTable(getdataset(),options = list(lengthMenu = c(10,20)))
 
   
   
   
   getxs<-reactive({
     colnames(getdataset())
   })
   
   
   getys<-reactive({
     colnames(getdataset())
   })
   
 output$xvarOut<-renderUI(expr = {
  selectInput(inputId = "xvar",label = "X Variable from Dataset for Regression",choices = getxs())
 })
 output$yvarOut<-renderUI(expr = {
   selectInput(inputId = "yvar",label="Y Variable from Dataset for Regression",choices=getys())
 })
})