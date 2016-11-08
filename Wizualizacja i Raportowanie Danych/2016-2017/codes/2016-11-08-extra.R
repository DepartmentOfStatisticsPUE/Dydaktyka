### wczytanie danych z Zeszyt2.xlsx i ich wizualizacja

## wczytujemy pakiety

library(readxl) ## wczytanie danych
library(dplyr) ## przetwarzanie
library(tidyr) ## czyszczenie
library(dplyr) ## wizualizacja

### wczytanie
dane <- read_excel('Wizualizacja i Raportowanie Danych/2016-2017/datasets/Zeszyt2.xlsx',skip = 1,col_names = F)

### zamiana nazwa
colnames(dane)[1:8] <- c('przekroj','ogolem','ogolem_10_6',
                    'rol_les','ogolem2','przetworstwo','budownictwo','handel')

### usuniecie niepotrzebnych wartosci i wybranie tylko wojewodztw
woj <- !grepl('^R\\.|POLSKA',dane$przekroj)
dane <- na.omit(dane[woj,1:8])

### sprawdzam wymiary
dim(dane)
## 16 x 8

## rysuje informacje dla wojewodztw (ogolem)

ggplot(data = dane,
       aes(x = reorder(przekroj,ogolem, mean),
           y = ogolem)) +
  geom_bar(stat='identity') +
  coord_flip() +
  xlab('Wojewodztwo') +
  ylab('Inwestycje?')


