shinyServer(function(input, output) {
  token <- "EAAHMe4DApvcBANyBjZCNqZBpRQzgDoOUX8OJFZCBqCZC7yyX1FYU4r0M5JNv6kfr1KFCe40Wyike5UldbNb9pxPZA2FoDvIwOxMAHRfixZC4qRfPwnmFeRrmfAAv26VGR32FJQcq5AueULWRdL9ZC0ZAnibf8q9Iv3s1t2Ww01xfsS2HrvWctzoaj3sgEunLaA5Spiii7PZB5ugZDZD"
  samuelp <- getPage("odiolaestadistica", token, n = 300, since='2018/04/01', until='2018/12/22')
  format.facebook.date <- function(datestring) {
    date <- as.POSIXct(datestring, format = "%Y-%m-%dT%H:%M:%S+0000", tz = "GMT")
  }
  samuelp <- samuelp %>%
    mutate(datetime=format.facebook.date(created_time))%>%   #Creamos una nueva variable de fecha
    group_by(datetime)%>%  #Agrupamos por fecha
    arrange(desc(datetime))  
  output$grafica <- renderPlot({
    ggplot(data= samuelp) + geom_line(mapping = aes(datetime,shares_count)) + geom_smooth(mapping = aes(datetime,shares_count), method = 'lm')
  
    })
  output$grafica2 <- renderPlot({
    #Nueva grafica
    ggplot(data= samuelp) + geom_line(mapping = aes(datetime,likes_count)) + geom_smooth(mapping = aes(datetime,likes_count), method = 'lm')
    
  })
  output$grafica3 <- renderPlot({
    #Nueva gráfica
    ggplot(data = samuelp) + geom_line(mapping = aes(datetime,comments_count)) + geom_smooth(mapping = aes(datetime,comments_count), method = 'lm')
  })
  output$grafica4 <- renderPlot({
    ggplot(data) + geom_line(mapping = aes(data$Publicado, data$`Lifetime Post Total Impressions`)) + geom_smooth(mapping = aes(data$Publicado,data$`Lifetime Post Total Reach`), method = 'lm')
      })
  output$grafica5 <- renderPlot({
    ggplot(data) + geom_line(aes(data$Publicado,data$`Lifetime Post Total Reach`)) + geom_smooth(mapping = aes(data$Publicado,data$`Lifetime Post Total Impressions`), method = 'lm')
    
  })
  output$grafica6 <- renderPlot({
    ggplot(data) + geom_line(aes(data$Publicado,data$`Lifetime Engaged Users`)) + geom_smooth(mapping = aes(data$Publicado,data$`Lifetime Engaged Users`), method = 'lm')
    
  })
  
  #Pantalla 1 
  #output$data <- renderTable({
   # data})
  output$summ <- renderPrint({
    summary(data[,-c(1)])
  })
  #2
  #output$samuelp <- renderTable({
  #  samuelp})
  output$summa <- renderPrint({
    summary(samuelp[,-c(1:8)])
  })
  
  
  
  ####Final###
  
  })
  

