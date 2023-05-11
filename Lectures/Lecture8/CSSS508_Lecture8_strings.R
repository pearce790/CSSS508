set.seed(7)

#### Section 1 ####

"01" == "1"
"01" == 1
"1" == 1
c(class("1"),class(1))

#### Section 2 ####
load(url("https://pearce790.github.io/CSSS508/Lectures/Lecture8/restaurants.Rdata"))
names(restaurants)
dim(restaurants)

nchar("Mike Pearce")

length_zip <- nchar(restaurants$Zip_Code)
table(length_zip)

substr("98126",3,5)

library(dplyr)
restaurants$ZIP_5 <- substr(restaurants$Zip_Code,1,5)
restaurants %>% distinct(ZIP_5) %>% head()

paste("Michael","Pearce")

paste("CSSS","508",sep= "_")
paste(c("CSSS","STAT"),"508",sep= "_")
paste(c("CSSS","STAT"),"508",sep= "_",collapse=" , ")

restaurants$mailing_address <- 
  paste(restaurants$Address,", ",
        restaurants$City,", WA ",restaurants$ZIP_5,
        sep = "")
restaurants %>% distinct(mailing_address) %>% head()

#### Section 3 ####
library(stringr)

nchar("weasels")
str_length("weasels")

str_sub("Washington", 2,4)

str_sub("Washington", 4, -3)

str_c(c("CSSS","STAT"),508)
str_c(c("CSSS","STAT"),508,sep=" ")
str_c(c("CSSS","STAT"),508,sep = " ",collapse = ", ")

unique_cities <- unique(restaurants$City)
unique_cities %>% head()

str_to_upper(unique_cities) %>% head()
str_to_lower(unique_cities) %>% head()
str_to_title(unique_cities) %>% head()

unique_names <- unique(restaurants$Name)
unique_names %>% head(3)

str_trim(unique_names) %>% head(3)

cars %>% filter(speed < 5 | speed > 24)
cars %>% filter(dist > 2 & dist <= 10)


str_detect(string = c("Hello","my name","is Michael"),
           pattern = "m")
str_detect(string = c("Hello","my name","is Michael"),
           pattern = "M")

unique_phones <- unique(restaurants$Phone)
unique_phones %>% tail(4)
str_detect(unique_phones,"206") %>% tail(4)

str_replace(string="Hi, I'm Michael",
            pattern="Hi",replacement="Hello")

dates <- restaurants$Date
dates %>% tail(3)
str_replace(dates,"-","_") %>% tail(3)

dates <- restaurants$Date
dates %>% tail(3)
str_replace_all(dates,"-","_") %>% tail(3)
