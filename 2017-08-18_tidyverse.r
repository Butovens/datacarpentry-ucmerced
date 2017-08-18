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
## the species_id column and a mew column called hindfoot_half containing values that are half 
## the hindfoot_length values. In this hindfoot_half column, there are no NAs and all values are 
## less than 30.

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
 
 ## Challenge
 
 ## 1. How many individuals were caught in each plot_type surveyed?
 surveys%>%
   group_by(plot_type)%>%
   tally
 
 ## 2. Use group_by() and summarize to find the mean, min, and max hindfoot for each species 
 ## (using species_id)
 surveys%>%
   group_by(species_id)%>%
   filter(!is.na(hindfoot_length))%>%
   summarize(mean_hindfoot= mean(hindfoot_length),
             min_hindfoot= min(hindfoot_length),
             max_hindfoot= max(hindfoot_length))
 
 ## 3. What was the heaviest animal measured in each year? Return the columns year, species_id 
 ## and weight
 surveys%>%
   select(year, genus, species_id, weight)%>%
   group_by(year)%>%
   top_n(1,weight)%>%
   arrange(year)
 
 ## answer 2
 surveys %>%
   filter(!is.na(weight))%>%
   group_by(year)%>%
   filter(weight== max(weight))%>%
   select(year,genus,species,weight)%>%
   arrange(year)
   
 
 ## 4. You saw above how to count the number of individuals of each sex using a
 ## combination of group_by() and tally(). How could you get the same result using
 ## group_by() and summarize()? Hint: see ?n.
   surveys %>%
   group_by(sex)%>%
   summarise(n())
 

 

   
 