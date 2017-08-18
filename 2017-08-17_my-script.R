## My script from data carpentry UC Merced
## Butovens Médé bmede@ucmerced.edu
## Aug 17-18, 2017...

## Download data into my R project  ----
download.file("https://ndownloader.figshare.com/files/2292169",
              "data/portal_data_joined.csv")

## read in data into R ----
surveys <- read.csv("data/portal_data_joined.csv")

## explore my data
head(surveys) # show first 6 rows of data
tail(surveys) # show last 6 rows of data
tail(surveys,12) # show last 12 rows of data

## summuries
str(surveys) # structure of the data
summary(surveys)

## explore size 
dim(surveys)
nrow(surveys)
ncol(surveys)

names(surveys)

## the $operator for isolating columns
tail(surveys$weight)
str(surveys$weight)
summary(surveys$weight)

## scatterplot : plot(x,y)
plot(surveys$year,surveys$weight)
plot(surveys$hindfoot_length,surveys$weight)

## explore month with histogram
summary(surveys$month)
hist(surveys$month,col='grey', breaks=12)

## explore factor variable

summary(surveys$taxa)
levels(surveys$taxa)
nlevels(surveys$taxa)
hist(surveys$taxa)  ## error

class(surveys$taxa) # it's a factor
table(surveys$taxa) # turns it into a table
class(table(surveys$taxa)) #now it's a table
barplot(table(surveys$taxa))

## subset in base R ----
## [rows, colums]

## returns all the columns for genus Ammodranus
surveys[surveys$genus == "Ammodroanus", ]

## returs a few columns
surveys[surveys$genus == 'Ammodranus', c('record_id','weight')]

## how many observation (rows) are there in January (1) and February(2)
## operator '|' says 'or'
nrow(surveys[surveys$month == 1 | surveys$month == 2, ])

table(surveys$month ==1 | surveys$month ==2)

## what's the length (i.e. how many rows) are less than 3
length(which(surveys$month < 3))

summary(surveys$month == 1)
summary(surveys$month == 2)


