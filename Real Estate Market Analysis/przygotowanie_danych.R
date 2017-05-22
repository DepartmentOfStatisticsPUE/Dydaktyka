## prepare data for rema

library(tidyverse)
library(stringi)
library(lubridate)
library(sp)
library(maptools)

load("/Users/MaciejBeresewicz/Documents/Projects/RProjects/Dydaktyka/REMA/2015-2016/datasets/pzn_rciwn.rda")
load("/Users/MaciejBeresewicz/Documents/Projects/RProjects/Dydaktyka/REMA/2015-2016/datasets/pzn_map.rda")

project_data <- pzn_rciwn %>% 
  filter(!is.na(trans_dwelling_price))

project_data$id1 <- group_indices(project_data,trans_ID)
project_data$id2 <- group_indices(project_data,trans_property_ID)


project_data <- project_data %>%
  mutate(dwelling_id = stri_paste(
    stri_pad_left(id1, width = 5, pad = '0'),
    '_',
    stri_pad_left(id2, width = 5, pad = '0')
  )) %>%
  select(dwelling_id,trans_date:lat)


#### lokalizacja

coordinates(project_data) <- ~lon + lat
proj4string(project_data) <- proj4string(map)

wynik <- over(project_data,map)


project_data <- project_data %>%
  tbl_df() %>%
  mutate(pzn_precinct = stri_trans_general(wynik$NZW,'latin-ascii'),
         pzn_district = stri_trans_general(wynik$ODDZ,'latin-ascii'))


project_data_train <- project_data %>% 
  dplyr::filter(year(trans_date) != 2014) %>%
  arrange(trans_date)

project_data_test <- project_data %>% 
  dplyr::filter(year(trans_date) == 2014) %>%
  arrange(trans_date) %>%
  mutate(order = row_number())

### save data

options(scipen = 10)

write.table(
  x = project_data_train,
  file = 'Real Estate Market Analysis/project_data_train.csv',
  quote = FALSE,
  na = '',
  sep = ',',
  dec = '.',
  row.names = F,
  fileEncoding = 'utf-8'
)

write.table(
  x = project_data_test %>%
    select(-trans_dwelling_price, -trans_dwelling_price_m2),
  file = 'Real Estate Market Analysis/project_data_test.csv',
  quote = FALSE,
  na = '',
  sep = ',',
  dec = '.',
  row.names = F,
  fileEncoding = 'utf-8'
)

write.table(
  x = project_data_test %>% 
    select(order, trans_dwelling_price) %>%
    rename(id = order,
           price = trans_dwelling_price),
  file = 'Real Estate Market Analysis/project_true.csv',
  quote = FALSE,
  na = '',
  sep = ',',
  dec = '.',
  row.names = F,
  fileEncoding = 'utf-8'
)

write.table(
  x = project_data_test %>% 
    select(order, trans_dwelling_price) %>%
    mutate(
      trans_dwelling_price = 
        round(rnorm(n = nrow(.), mean = 100000, sd = 10),2))  %>%
    rename(id = order,
           price = trans_dwelling_price),
  file = 'Real Estate Market Analysis/project_sample_sub.csv',
  quote = FALSE,
  na = '',
  sep = ',',
  dec = '.',
  row.names = F,
  fileEncoding = 'utf-8'
)
