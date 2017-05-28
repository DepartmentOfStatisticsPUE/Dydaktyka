library(tidyverse)
library(haven)
load('~/Documents/Uczelnia/Zbiory/BKL/ludnosc/bkl_lud.rda')


bkl_lud %>%
  filter(edycja > 2010) %>% 
  count(edycja, m11_internet, wt = waga_pop) %>%
  mutate(p = n/sum(n))


### szacowanie liczby osób zatrudnionych na pełen etat  (m3_1_pel)
### edycji (2011 - 2014)
### województw
### płci

### wartości prawdziwe
bkl_lud %>%
  filter(edycja > 2010) %>%
  count(edycja, wojew, m1_plec, m3_1_pel, wt = waga_pop) %>%
  mutate(p = round(n / sum(n), 4)) %>%
  filter(m3_1_pel == 1) %>%
  rename(woj = wojew,
         plec = m1_plec) %>%
  ungroup() %>%
  mutate(id = paste(edycja, woj, plec, sep = "_")) %>% 
  select(id, p) %>% 
  write.table(x = .,
    file = '~/Documents/Uczelnia/Dydaktyka/Badania Internetowe/data-raw/res.csv',
    sep = ',',
    dec = '.',
    row.names = F,
    col.names = T)

### przykładowy wynik

bkl_lud %>%
  filter(edycja > 2010) %>%
  count(edycja, wojew, m1_plec, m3_1_pel, wt = waga_pop) %>%
  mutate(p = round(n / sum(n), 4)) %>%
  filter(m3_1_pel == 1) %>%
  rename(woj = wojew,
         plec = m1_plec) %>%
  ungroup() %>%
  mutate(id = paste(edycja, woj, plec, sep = "_"),
         p = 0.5) %>% 
  select(id,p) %>%
  write.table(
    x = .,
    file = '~/Documents/Uczelnia/Dydaktyka/Badania Internetowe/data-raw/sample_sub.csv',
    sep = ',',
    dec = '.',
    row.names = F,
    col.names = T
  )


#### przygotowanie danych do konkursu


dane_wejsciowe <- bkl_lud %>%
  filter(edycja > 2010) %>%
  select(respid, id, intnr, edycja, region6, wojew, powiat, 
         miejsce, metoda:czas, m1_plec, m2_rokur, 
         wiek, wykszt_5k, m3_6_uczy, m4_cywil, m5_dzieci, 
         eduk_lata, m3_1_staz, m7_1, m8_1,m11_internet:m11_4, 
         m3_1_pel) %>%
  mutate(m3_1_pel = ifelse(m11_internet == 0, NA, m3_1_pel))

sjPlot::view_df(x = dane_wejsciowe[,-c(1:3)],
                show.values = T, 
                show.na = T,
                show.frq = T)

write.table(
  x = dane_wejsciowe,
  file = '~/Documents/Uczelnia/Dydaktyka/Badania Internetowe/data-raw/data.csv',
  sep = ',',
  dec = '.',
  row.names = F,
  col.names = T
)

### wielkość populacji

bkl_lud %>%
  filter(edycja > 2010) %>%
  count(edycja, wojew, wiek_4k, m1_plec, wt = waga_pop) %>%
  mutate(N = ceiling(n)) %>%
  rename(woj = wojew,
         plec = m1_plec,
         wiek = wiek_4k) %>%
  ungroup() %>%
  select(-n) %>%
  write.table(
    x = .,
    file = '~/Documents/Uczelnia/Dydaktyka/Badania Internetowe/data-raw/populacja.csv',
    sep = ',',
    dec = '.',
    row.names = F,
    col.names = T
  )

