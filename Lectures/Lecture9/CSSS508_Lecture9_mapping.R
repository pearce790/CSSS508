#### Initial Data/Package Loading ####
library(ggplot2)
library(readr)
library(dplyr)
spd_raw <- read_csv("https://clanfear.github.io/CSSS508/Seattle_Police_Department_911_Incident_Response.csv")
glimpse(spd_raw)

#### 1. ggmap ####

ggplot(spd_raw, 
       aes(Longitude, Latitude)) + 
  geom_point() + 
  coord_fixed() + # evenly spaces x and y
  ggtitle("Seattle Police Incidents",
          subtitle="March 25, 2016") +
  theme_classic()


# install.packages("ggmap")
# if(!requireNamespace("remotes")){install.packages("remotes")}
# remotes::install_github("dkahle/ggmap", ref = "tidyup")

library(ggmap)

qmplot(data = spd_raw,
       x = Longitude, 
       y = Latitude)

qmplot(data = spd_raw,
       x = Longitude, 
       y = Latitude,
       color=I("navy"))

qmplot(data = spd_raw,
       x = Longitude, 
       y = Latitude,
       color=I("navy"),
       alpha=I(0.5))

qmplot(data = spd_raw,
       geom = "blank", 
       x = Longitude, 
       y = Latitude,
       darken = 0.5)+
  stat_density_2d(
    aes(fill = stat(level)), 
    geom = "polygon", 
    alpha = .2, color = NA)+
  scale_fill_gradient2(
    "Incident\nConcentration", 
    low = "white", 
    mid = "yellow", 
    high = "red")+
  theme(legend.position = "bottom")

#### 2. Density plots ####

qmplot(data = spd_raw,
       geom = "blank", #<<
       x = Longitude, 
       y = Latitude)

qmplot(data = spd_raw,
       geom = "blank",
       x = Longitude, 
       y = Latitude)+
  stat_density_2d( #<<
    aes(fill = stat(level)), #<<
    geom = "polygon") #<<

qmplot(data = spd_raw,
       geom = "blank",
       x = Longitude, 
       y = Latitude)+
  stat_density_2d(
    aes(fill = stat(level)),
    geom = "polygon")+
  scale_fill_gradient2( #<<
    low = "white", #<<
    mid = "yellow", #<<
    high = "red") #<<

qmplot(data = spd_raw,
       geom = "blank",
       x = Longitude, 
       y = Latitude,
       darken = 0.5)+ #<<
  stat_density_2d(
    aes(fill = stat(level)), 
    geom = "polygon", 
    alpha = .2, #<<
  )+
  scale_fill_gradient2(
    "Incident\nConcentration", #<<
    low = "white", 
    mid = "yellow", 
    high = "red")+
  theme(legend.position = "bottom") #<<

#### 3. Labeling points ####

downtown <- spd_raw %>%
  filter(Latitude > 47.58, Latitude < 47.64,
         Longitude > -122.36, Longitude < -122.31)

assaults <- downtown %>% 
  filter(`Event Clearance Group` %in%
           c("ASSAULTS", "ROBBERY")) %>%
  mutate(assault_label = `Event Clearance Description`)

qmplot(data = downtown,
       x = Longitude,
       y = Latitude,
       maptype = "toner-lite",
       color = I("firebrick"),
       alpha = I(0.5)) +  
  geom_label(data = assaults, #<<
             aes(label = assault_label), #<<
             size=2) #<<

library(ggrepel)
qmplot(data = 
         downtown,
       x = Longitude,
       y = Latitude,
       maptype = "toner-lite", 
       color = I("firebrick"), 
       alpha = I(0.5)) + 
  geom_label_repel( #<<
    data = assaults,
    aes(label = assault_label), 
    size=2)
