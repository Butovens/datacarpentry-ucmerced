## Data visualization
library(tidyverse)

surveys_complete <- read.csv('data_output/surveys_complete.csv')

## ggplot2 
## takes data called "surveys_complete", has aesthetic with x abscise weight and y abscise
## hindfoot_length. Then create plot with geom_point
ggplot(data= surveys_complete, aes( x= weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, aes(color = species_id))


## Challenge
## Use what you just learned to create a scattet plot of weight over species_id with the plot types
## showing in different colors. Is this a good way to show this type of data

ggplot(data= surveys_complete, aes( x= weight, y = species_id)) +
  geom_point(alpha = 0.1, aes(color = plot_type))


## Bocplot instead of a scatter
ggplot(data= surveys_complete, aes( x= species_id, y = weight)) +
  geom_boxplot(aes(color = plot_type)) +
  facet_grid(sex ~ .)+
  labs(x = "Species",
       y = "Weight",
       title = "Plot")

## Time Series
 yearly_counts <- surveys_complete %>%
   group_by(year, species_id)%>%
   tally
 
 ggplot(data = yearly_counts,
        aes(x = year, y = n,
            group = species_id,
            color = species_id)) + 
   geom_line() +
   facet_wrap(~ species_id)

 
 ## Examining the times series of species + sex
 yearly_sex_counts <- surveys_complete%>%
   group_by(year, species_id,sex) %>%
   tally
 
 ggplot(data= yearly_sex_counts,
        aes(x =year, y = n, color = sex)) +
   geom_line() +
   facet_wrap(~ species_id)
 
 ## Challenge 
 ## Use what you just learned to create a plot that depicts how the average weight of each 
 ## species changes through year 
 
 yearly_average_weight <- surveys_complete%>%
   group_by(year, species_id)%>%
   summarize(mean_weight= mean(weight))
   
 my_plot <- ggplot(data = yearly_average_weight,
        aes(x = year, y = mean_weight,
            color= species_id)) +
   geom_line()+
   facet_wrap(~ species_id)+
   labs(x = "Year",
        y = "Mean weight (g)") +
   theme_bw() +
   theme(axis.text = element_text(angle = 90),
 legend.position= "none")
 
 ## saving plot 
 ggsave("my_plot.png", my_plot, width = 15, height = 10) 
  