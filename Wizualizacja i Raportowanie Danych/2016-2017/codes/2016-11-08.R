### Zajęcia 8.11.2016

## Co będziemy robić na zajeciach?
### cel wykorzystania wykresów punktowych / rozrzutu
### analiza 
### przetworzenie zbioru do analizy wielowymiarowej z wykorzystaniem facet_wrap

library(dplyr)
library(rio)

### wczytujemy dane o studentach
stu <- import('Wizualizacja i Raportowanie Danych/2016-2017/datasets/BKL_studenci_1_4ed.sav')

tbl_df(stu) %>%
  select(edycja,kod_A1_1min,A6,starts_with('E1'),waga_polaczona) %>%
  View()


