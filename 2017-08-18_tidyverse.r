surveys <- read.csv("Data/portal_data_joined.csv")
install.packages("tidyverse")
library(tidyverse)

## select columns plot_id, species_id and weight
select(surveys, plot_id, species_id, weight)

## using filter select rows whre year is 1995
filter(surveys, year == 1995)

#PIPES!!!

## THIS IS A PIPE  %>%
## In this example we created an object "surveys_sml" that gets the data set 
## surveys, filters it to only the year 1995, and among the 
## 1995 year select the columns plot_id, species_id, weight, year
surveys_sml <- surveys %>%
  filter(year == 1995) %>%
  select(plot_id,species_id, weight, year) 

## mutate add a column to dataset
surveys%>%
  filter(!is.na(weight))%>%
  mutate(weight_kg = weight / 1000,
         weight_kg2= weight_kg * 2) %>%
  head

## Challenge
## Create a new data frame from the surveys data that meets the following criteria: contains only
## the species_id column and a mew column called 

##tha are half the hindfoot_length values. In this hindfoot_half 

surveys_hindfoot <- surveys %>%
  mutate(hindfoot_half = hindfoot_length / 2) %>%
  filter(!is.na(hindfoot_half),hindfoot_half < 30) %>%
  select(species_id,hindfoot_half)

## group.by and summarize
 surveys %>%
   filter(!is.na(weight),
          sex =="F" | sex == "M") %>%
   group_by(sex, species_id) %>%
 summarize(mean_weight = mean(weight),
           min_weight = min(weight))

 ## group.by and summarize other way to do it
 surveys %>%
   filter(!is.na(weight),
          sex =="F" | sex == "M") %>%
   group_by(sex, species_id) %>%
   summarize(mean_weight = mean(weight, na.rm =T),
             min_weight = min(weight, na.rm =T))

 ## tally counts the total number of abservations for the variables
 surveys %>%
   group_by(sex) %>%
   tally
 