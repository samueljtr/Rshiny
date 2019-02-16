
library(shiny)

# Define UI for application that draws a histogram
shinyUI(dashboardPage(
  dashboardHeader(title = "Odio la estadistica", dropdownMenuOutput("msgOutput"),
                  dropdownMenu(type= "notifications",
                               notificationItem(
                                 text = "Mission Acomplished",
                                 icon = icon("check-circle"),
                                 status = "success"))
                  
                  
                  
                  
                  ),

  
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "p1", icon=icon("dashboard")),
                menuItem("Detail Analysis", tabName =  "p2", icon = icon("bar-chart-o")),
                menuItem("Social networks", tabName =  "p3", icon = icon("users"))
      )
    
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "p2",
              h2("Detail Analysis"),
              fluidRow(
                
                box(title = "Shares", status = "primary", solidHeader = T,plotOutput(outputId = "grafica")),
                #Añadir algún filtro o boton especial
                box(title = "Likes", status = "primary", solidHeader = T,plotOutput(outputId = "grafica2")),
                box(title = "Comments", status = "primary", solidHeader = T,plotOutput(outputId = "grafica3")),
                box(title = "Impressions", status = "primary", solidHeader = T,plotOutput(outputId = "grafica4")),
                box(title = "Reach", status = "primary", solidHeader = T,plotOutput(outputId = "grafica5")),
                box(title = "Engaged", status = "primary", solidHeader = T,plotOutput(outputId = "grafica6"))
      )
    ),
    tabItem(tabName = "p1",
            h1("Summary of Fanspage"),
            #Añadir lo qe queremos en nuestra pestaña 1 
            fluidRow(
            mainPanel(
              tabsetPanel(type = "tab" ,
                          #tabPanel("Data",tableOutput("data")) ,
                          tabPanel("Summary" , verbatimTextOutput("summ"))
                
              ), 
              tabsetPanel(type = "tab" , 
                          #tabPanel("Data", tableOutput("samuelp")),
                          tabPanel("Summary" , verbatimTextOutput("summa"))
            )
            #Aquí termina el contenidp de la p1    
            )
            )
    
    ),
    
    tabItem(tabName = "p3" ,
            h3("Social Network",br(),"Followers"),
              #Contenido de la pestaña3
            fluidRow(
              infoBox("Twitter +", 111-97 , icon =  icon("dove"), color = "aqua"),
              infoBox( "Facebook +" , 3845-3722 , icon = icon("globe"), color = "navy"),
              infoBox( "Instagram +" , 1320-1211 , icon = icon("camera-retro"), color = "light-blue")
              ),
            fluidRow(
              valueBox(111 ,"twitter.com/odioestadistica" ,icon = icon("dove"), color= "aqua")
              ),
            fluidRow(
              valueBox(1320 , "instagram.com/odiolaestadistica/" , icon = icon("camera-retro"), color = "light-blue")
              ),
            fluidRow(
              valueBox(3845 , "facebook.com/odiolaestadistica/" , icon = icon("globe"), color = "navy")
              
            )
            )
    
   ########Final### 
      )
    )
  )
)

