surveys <- read.csv("Data/portal_data_joined.csv")
install.packages("tidyverse")
library(tidyverse)

## select columns plot_id, species_id and weight
select(surveys, plot_id, species_id, weight)

## using filter select rows whre year is 1995
filter(surveys, year == 1995)

#PIPES!!!

## THIS IS A PIPE  %>%
surveys_sml <- surveys %>%
  filter(year == 1995) %>%
  select(plot_id,species_id, weight, year) 
