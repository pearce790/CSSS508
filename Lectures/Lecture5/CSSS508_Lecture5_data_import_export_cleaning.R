library(readr)

billboard_2000_raw <- read_csv(file = "https://clanfear.github.io/CSSS508/Lectures/Week5/data/billboard.csv")

library(dplyr)
dim(billboard_2000_raw)
names(billboard_2000_raw) %>% head(20)

getwd()
#write_csv(billboard_2000_raw, path = "billboard_data.csv")


billboard_2000_raw %>% head(10)

library(tidyr)
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

billboard_2000 %>% select(date.entered) %>% head(10)

library(lubridate)
head(billboard_2000$date.entered,5)
year(billboard_2000$date.entered) %>% head(5)
month(billboard_2000$date.entered) %>% head(5)
day(billboard_2000$date.entered) %>% head(5)

wday(billboard_2000$date.entered) %>% head(5)
quarter(billboard_2000$date.entered) %>% head(5)
leap_year(billboard_2000$date.entered) %>% head(5)


## Activity: My Answer
billboard_2000_question <- billboard_2000 %>%
  group_by(artist, track) %>%
  mutate(`Weeks at #1` = sum(rank == 1),
         `Peak Rank`   = ifelse(any(rank == 1),
                                "Hit #1",
                                "Didn't #1")) 

library(ggplot2)
billboard_trajectories <- 
  ggplot(data = billboard_2000_question,
         aes(x = week, y = rank, group = track,
             color = `Peak Rank`)) +
  geom_line(aes(size = `Peak Rank`), alpha = 0.4) +
  theme_classic() +
  xlab("Week") + ylab("Rank") +
  scale_color_manual(values = c("black", "red")) +
  scale_size_manual(values = c(0.25, 1)) +
  theme(legend.position = c(0.90, 0.75),
        legend.background = element_rect(fill="transparent"))

billboard_trajectories
