## Importing and Exporting Data
library(readr)
billboard_2000_raw <- read_csv(file = "https://clanfear.github.io/CSSS508/Lectures/Week5/data/billboard.csv")
str(billboard_2000_raw[, 65:ncol(billboard_2000_raw)])

billboard_2000_raw <- read_csv(
  file = "https://clanfear.github.io/CSSS508/Lectures/Week5/data/billboard.csv",
  guess_max = 5000) # Default is 1000

getwd()
write_csv(billboard_2000_raw, path = "billboard_data.csv")

## Cleaning and Reshaping Data
library(pander)
pander(head(billboard_2000_raw[,1:10], 10), split.tables=120, style="rmarkdown")

library(tidyr)
library(dplyr)
billboard_2000 <- billboard_2000_raw %>%
  pivot_longer(cols=wk1:wk76,#<<
               names_to ="week", #<<
               values_to = "rank") #<<
billboard_2000 %>% head(5)

summary(billboard_2000$rank)

billboard_2000 <- billboard_2000_raw %>%
  pivot_longer(cols=wk1:wk76, 
               names_to ="week", 
               values_to = "rank", 
               values_drop_na = TRUE) #<<
summary(billboard_2000$rank)

dim(billboard_2000)

head(billboard_2000$week)

billboard_2000 <- billboard_2000 %>%
  mutate(week = parse_number(week)) #<<
summary(billboard_2000$week)

## Dates and Times

billboard_2000 %>% select(date.entered) %>% head(10)
library(lubridate)
head(billboard_2000$date.entered,5)
year(billboard_2000$date.entered) %>% head(5)
month(billboard_2000$date.entered) %>% head(5)
day(billboard_2000$date.entered) %>% head(5)
wday(billboard_2000$date.entered) %>% head(5)
quarter(billboard_2000$date.entered) %>% head(5)
leap_year(billboard_2000$date.entered) %>% head(5)
