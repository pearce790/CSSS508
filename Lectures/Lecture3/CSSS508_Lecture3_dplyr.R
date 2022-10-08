## ---- message=FALSE, warning=FALSE------------------------------------------------------------
library(dplyr)
library(gapminder)
gapminder %>% filter(country == "Canada") %>% head(2)


## ---------------------------------------------------------------------------------------------
Canada <- gapminder %>% filter(country == "Canada")


## ---------------------------------------------------------------------------------------------
former_yugoslavia <- c("Bosnia and Herzegovina", "Croatia", 
                       "Montenegro", "Serbia", "Slovenia")
Yugoslavia <- gapminder %>% filter(country %in% former_yugoslavia)
head(Yugoslavia, 4)


## ---------------------------------------------------------------------------------------------
gapminder %>% distinct(continent, year) %>% head(6)


## ---------------------------------------------------------------------------------------------
gapminder %>% distinct(continent, year, .keep_all=TRUE) %>% head(6)


## ---------------------------------------------------------------------------------------------
Yugoslavia %>% select(country, year, pop) %>% head(4)


## ---------------------------------------------------------------------------------------------
Yugoslavia %>% select(-continent, -pop, -lifeExp) %>% head(4)


## ---------------------------------------------------------------------------------------------
gapminder %>% pull(lifeExp) %>% head(4)


## ---------------------------------------------------------------------------------------------
gapminder %>% select(lifeExp) %>% head(4)


## ---------------------------------------------------------------------------------------------
Asia_and_Oceania <- gapminder %>% 
  filter(continent %in% c("Asia", "Oceania"))
head(Asia_and_Oceania,4)


## ---------------------------------------------------------------------------------------------
Asia_and_Oceania <- Asia_and_Oceania %>% select(-lifeExp,-gdpPercap)
head(Asia_and_Oceania,4)


## ---------------------------------------------------------------------------------------------
Asia_and_Oceania %>% 
  distinct(country,continent,.keep_all=TRUE) %>%
  head(4)


## ---------------------------------------------------------------------------------------------
Yugoslavia %>% arrange(year, desc(pop)) %>% head(6)


## ---------------------------------------------------------------------------------------------
Yugoslavia %>% select(country,year,lifeExp) %>%
  rename(Life_Expectancy = lifeExp) %>%
    head(4)


## ---------------------------------------------------------------------------------------------
library(pander)
Yugoslavia %>% filter(country == "Serbia") %>%
    select(year, lifeExp) %>%
    rename(Year = year, `Life Expectancy` = lifeExp) %>% #<<
    head(5) %>%
    pander(style = "rmarkdown", caption = "Serbian life expectancy")


## ---------------------------------------------------------------------------------------------
Yugoslavia %>% select(country, year, pop) %>%
    mutate(pop_million = pop / 1000000) %>% #<<
    head(5)


## ---------------------------------------------------------------------------------------------
Yugoslavia %>% 
  mutate(country = recode(country, 
                        `Bosnia and Herzegovina`="B and H", #<<
                        Montenegro="M")) %>%
  distinct(country, .keep_all=TRUE)


## ---------------------------------------------------------------------------------------------
gapminder %>% arrange (pop) %>%  head(5)


## ---------------------------------------------------------------------------------------------
gapminder %>% 
  filter(country %in% c("United States","United Kingdom")) %>%
  mutate(country = recode(country,
                          "United States" = "US",
                          "United Kingdom"="UK")) %>%
  distinct(country,continent)


## ---------------------------------------------------------------------------------------------
Yugoslavia %>% filter(year == 1982) %>%
    summarize(n_obs          = n(),
              total_pop      = sum(pop),
              mean_life_exp  = mean(lifeExp),
              range_life_exp = max(lifeExp) - min(lifeExp))


## ---------------------------------------------------------------------------------------------
Yugoslavia %>%
  group_by(year) %>% #<<
  summarize(num_countries     = n_distinct(country),
            total_pop         = sum(pop),
            total_gdp_per_cap = sum(pop*gdpPercap)/total_pop) %>%
  head(5)


## ---------------------------------------------------------------------------------------------
meanGDP_2000s <- gapminder %>% 
  filter(country %in% c("Canada","United States","Mexico"), 
         year > 2000 & year <= 2010) %>% 
  group_by(country) %>%
  summarize(meanGDP = mean(gdpPercap))
meanGDP_2000s


## ----fig.height=5-----------------------------------------------------------------------------
library(ggplot2)
ggplot(meanGDP_2000s,aes(country,meanGDP)) +geom_col() + 
  xlab("Country") + ylab("Mean GDP") + ylim(c(0,45000)) + 
  ggtitle("Average GDP by Country (2000-2010)",subtitle = "North America")


## ---------------------------------------------------------------------------------------------
# install.packages("nycflights13") # Uncomment to run
library(nycflights13)

data(flights)
data(airlines)
data(airports)
data(planes)
data(weather)


## ---------------------------------------------------------------------------------------------
flights %>% left_join(airlines, by = "carrier") %>%
  select(flight,origin,dest,carrier,name) %>%
  head(5)


## ---------------------------------------------------------------------------------------------
flights %>% left_join(airlines, by = "carrier") %>%
  filter(dest == "SEA") %>%
  group_by(name) %>% 
  summarize(num_flights = n())


## ---------------------------------------------------------------------------------------------
flights %>% left_join(planes, by = "tailnum") %>%
  select(flight,origin,dest,tailnum,manufacturer) %>%
  head(5)


## ---------------------------------------------------------------------------------------------
flights %>% left_join(planes, by = "tailnum") %>%
  filter(origin == "JFK",dest == "SEA") %>% 
  group_by(manufacturer) %>% 
  summarize(count_flights = n())


## ----fig.height=4,fig.width=9-----------------------------------------------------------------
JFK_Seattle_manufacturers <- flights %>% left_join(planes, by = "tailnum") %>%
  filter(origin == "JFK",dest == "SEA") %>% 
  group_by(manufacturer) %>% summarize(count_manufacturer = n())
ggplot(JFK_Seattle_manufacturers,aes(manufacturer,count_manufacturer))+
  geom_col()+xlab("Manufacturer")+ylab("Count")

