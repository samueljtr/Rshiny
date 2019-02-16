#Cargar los paquetes
library(ggplot2)
library(tidyr)
library(dplyr)
library(Rfacebook)
library(shinydashboard)
library(shiny)
#Guardar nuestro token en un objeto de R
token <- "EAAHMe4DApvcBACgJYZCje1dFFkcHayFY5UaxmZCAR8ZCD3rrVk9aZB45U7kI5wC5hYUqAqtoTAR3QDdKPpOpuxXtlk2HZCnSahGJDSZCxkLEXkjGkm1NmAtcJEBW6F2ZCZAqpAUXAfekfUneZCKZAhhFZBbaGaKLs0aQAlfscanIqsIAqyUj2hqjbGHVuPrGrF4n50ZD"
samuelp <- getPage("odiolaestadistica", token, n = 350, since='2018/04/01', until='2019/02/15')
#Ya tenemos cargada nuestra data de odiola estadistica
#NO BORRAR EL TOKEN
#Podemos cambiar la variable n, since y until
#Comenzaremos con acomodar los datos
glimpse(samuelp)
#Crear una funci?n para dar formato de fecha

format.facebook.date <- function(datestring) {
  date <- as.POSIXct(datestring, format = "%Y-%m-%dT%H:%M:%S+0000", tz = "GMT")
}
#Transformamos la base de datos de la p?gina
samuelp <- samuelp %>%
  mutate(datetime=format.facebook.date(created_time))%>%   #Creamos una nueva variable de fecha
  group_by(datetime)%>%  #Agrupamos por fecha
  arrange(desc(datetime)) #La ordenamos de forma descendente
#Ahora vamos a limpiar la data
library(dplyr)
#datosacomodados <- data.frame(select(samuelp, likes_count, shares_count , comments_count , datetime))
#data.frame(datosacomodados)
#Graficar
# The easiest way to get ggplot2 is to install the whole tidyverse:
#install.packages("tidyverse")

# Alternatively, install just ggplot2:
#install.packages("ggplot2")
library(tidyverse)
library(ggplot2)

ggplot(data= samuelp) + geom_line(mapping = aes(datetime,shares_count)) + geom_smooth(mapping = aes(datetime,shares_count), method = 'lm')
#r + labs(x= "Fecha de publicaci?n", y= "N? de compartidas") +ggtitle("Gr?fico de publicaciones \n con respecto a veces compratidas")
ggplot(data= samuelp) + geom_line(mapping = aes(datetime,likes_count)) + geom_smooth(mapping = aes(datetime,likes_count) , method = 'lm')
ggplot(data= samuelp) + geom_line(mapping = aes(datetime,comments_count)) + geom_smooth(mapping = aes(datetime,comments_count), method = 'lm')
############################################################
#AJ <- read.csv("Data1.csv" , header = T, sep = ",")
#AJr <- AJ[ , -c(1,2,3,4,5,6,8,12,13,14,15)]
##arrange lo ordena de forma 04......06
#                    #arrange(desc(datetime))   06.......04
#JS <- read.csv("Data2.csv" , header =  T , sep = ",")
#JSr <- JS[ , -c(1,2,3,4,5,6,8,12,13,14,15)]
# #arrange lo ordena de forma 04......06
##arrange(desc(datetime))   06.......04
#  
##merge para unir data.frames   rbind   y cbind
#names(AJr)
#names(JSr)
#semestre <- rbind(AJr,JSr)
#semestrel <- semestre[-c(1,91), ]
#semestrel <- semestrel %>%
#  
#  arrange(desc(semestrel$Publicado))
#
#
# 
#data.frame$var=as.numeric(data.frame$var)
#               =as.character
#               =as.factor
#               =as.integer
#semestrel$Lifetime.Post.Total.Reach = as.numeric(semestrel$Lifetime.Post.Total.Reach)
#semestrel$Lifetime.Post.Total.Impressions = as.numeric(semestrel$Lifetime.Post.Total.Impressions)
#semestrel$Lifetime.Engaged.Users = as.numeric(semestrel$Lifetime.Engaged.Users)
#glimpse(semestrel)
#glimpse(samuelp)

#ggplot(semestrel) + geom_point(mapping = aes(semestrel$Publicado, semestrel$Lifetime.Post.Total.Impressions))
#########################################################
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

