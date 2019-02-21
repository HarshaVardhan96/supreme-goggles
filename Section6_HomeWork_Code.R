# Advanced Visualization Section Homework

# setting Working Directory

getwd()
setwd("C:\\Users\\Harsha Vardhan\\Desktop\\R")

# Importing Data

movies_data <- read.csv(choose.files("Section6-Homework-Data.csv"))
 
# Exploring the Data Frame

ncol(movies_data)
nrow(movies_data)
head(movies_data, n = 10)
tail(movies_data)
str(movies_data)

     #  Interesting to see only 6 levels of Day.of.Week
 
levels(movies_data$Day.of.Week)

      # huh, no movie is released on Monday

summary(movies_data)
      
      # moreover 448 of 608 movies were released on Friday

448/608 *100

      # Thats about 74% of movies 

# Filtering the required data

req_Genre <- movies_data$Genre == "action" |
  movies_data$Genre == "adventure" |
  movies_data$Genre == "animation" |
  movies_data$Genre == "comedy" |
  movies_data$Genre == "drama"

req_Studio <- movies_data$Studio == "Buena Vista Studios" |
  movies_data$Studio == "Fox" |
  movies_data$Studio == "Paramount Pictures" |
  movies_data$Studio == "Sony" |
  movies_data$Studio == "Universal" |
  movies_data$Studio == "WB" 
  
# Combining the above two logical vectors 

req_data <- movies_data[req_Genre & req_Studio , ]

# Exploring the filtered data frame

ncol(req_data)
nrow(req_data)
head(req_data,n=20)
tail(req_data)
str(req_data)
summary(req_data)
    # further check
req_data_dummy <- movies_data[!(req_Genre & req_Studio) , ]
nrow(req_data_dummy) + nrow(req_data) == nrow(movies_data) # TRUE :)

  # Ready to get the plot

library(ggplot2)

# Data layer + Aesthetics

h <- ggplot(data = req_data ,aes(x = Genre , y = Gross...US) ) 

# Geom layer of Jitter and Boxplot

k <- h + geom_jitter( aes(color = Studio , size = Budget...mill. ))+
  geom_boxplot(alpha = 0.5 ,outlier.colour = NA) 


# loading extra font for theme layer

install.packages("extrafont")
library(extrafont)
?extrafont
loadfonts(device = "win")


l <-  k +  
  
      # changing labels of the axes and adding title to plot
  
    xlab("Genre") + ylab("Gross%US") + 
  ggtitle(" Domestic Gross % by Genre") +
  
   # applying theme to the plot
  
     theme( 
           axis.title.x = element_text(size = 25 , colour = "Blue") ,
           axis.title.y = element_text(size = 25 , colour = "Blue"),
           axis.text.x = element_text(size = 12 ),
           axis.text.y = element_text(size = 12),
           plot.title = element_text(hjust = 0.5, size = 30),
           legend.text = element_text(size = 10),
           legend.title = element_text(size = 15),
           text = element_text(family = "Comic Sans MS"))

# changing label name

 l$labels$size="Budget $M"
 
# Answer :) 
 
l
     






    
          


  
  
  
  






         
       


