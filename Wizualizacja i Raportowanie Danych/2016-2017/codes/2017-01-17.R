library(dplyr)
library(haven)
library(tidyr)
dane <- read_spss('Wizualizacja i Raportowanie Danych/2016-2017/datasets/BKL_studenci_1_4ed.sav')

dim(dane)

###
names(dane) <- tolower(names(dane)) 


dane %>%
  count(edycja,C2)

dane_2013 <- dane %>% filter(edycja == 1)

dane_2013 %>% 
  count(c1,c1_rek) 

dane_2013 %>% 
  count(c2,c2rek) 

dane_2013 %>%
  mutate(c1_f = c1_rek == -2,
         c2_f = c2rek == -2,
         c4_f = c4.1 == -2) %>% 
  count(c1_f,c2_f,c4_f) %>%
  summary()
  
### usunięcie braków danych
dane_2013_bez_brak <- 
  subset(dane_2013, subset = !is.na(C2))

## to samo ale z dplyr

dane_2013_bez_brak <- 
  filter(dane_2013, 
         !is.na(c2rek) & !is.na(C1) & 
           !is.na(C4.1))

dane_2013_bez_brak <- 
  dane_2013_bez_brak %>%
  mutate(pyt1 = C2 )


dane_2013_bez_brak %>% 
  count(C2,C1,C4.1)


