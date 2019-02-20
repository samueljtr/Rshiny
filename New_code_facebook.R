library(ggplot2)
library(tidyr)
library(dplyr)
#library(Rfacebook)
#library(shinydashboard)
#library(shiny)
#install.packages("httr")
#install.packages("rjson")
#install.packages("httpuv")
#library(httr)
#library(rjson)
#library(httpuv)
fb_oauth <- fbOAuth(app_id="506305789863671", app_secret="31f9bf5846d58cdf7636eb3f153c7126")
save(fb_oauth, file="fb_oauth")
load("fb_oauth")
me <- getPage("odiolaestadistica", token=fb_oauth , n= 350 , since='2018/04/01', until='2019/02/20' )
glimpse(me)
format.facebook.date <- function(datestring) {
  date <- as.POSIXct(datestring, format = "%Y-%m-%dT%H:%M:%S+0000", tz = "GMT")
}
me <- me %>%
  mutate(datetime=format.facebook.date(created_time))%>%   #Creamos una nueva variable de fecha
  group_by(datetime)%>%  #Agrupamos por fecha
  arrange(desc(datetime))

ggplot(data= me) + geom_line(mapping = aes(datetime,shares_count)) + geom_smooth(mapping = aes(datetime,shares_count), method = 'lm')
#r + labs(x= "Fecha de publicaci?n", y= "N? de compartidas") +ggtitle("Gr?fico de publicaciones \n con respecto a veces compratidas")
ggplot(data= me) + geom_line(mapping = aes(datetime,likes_count)) + geom_smooth(mapping = aes(datetime,likes_count) , method = 'lm')
ggplot(data= me) + geom_line(mapping = aes(datetime,comments_count)) + geom_smooth(mapping = aes(datetime,comments_count), method = 'lm')


data <- read_xls("tri1.xls")
glimpse(data)
#data <- data %>%
# arrange(desc(Publicado))

data.frame(head(data))
summary(data[,-c(1)])
summary(data)
ggplot(data) + geom_line(mapping = aes(data$Publicado, data$`Lifetime Post Total Impressions`)) + geom_smooth(mapping = aes(data$Publicado,data$`Lifetime Post Total Reach`), method = 'lm')
ggplot(data) + geom_line(aes(data$Publicado,data$`Lifetime Post Total Reach`)) + geom_smooth(mapping = aes(data$Publicado,data$`Lifetime Post Total Impressions`), method = 'lm')
ggplot(data) + geom_line(aes(data$Publicado,data$`Lifetime Engaged Users`)) + geom_smooth(mapping = aes(data$Publicado,data$`Lifetime Engaged Users`), method = 'lm')
