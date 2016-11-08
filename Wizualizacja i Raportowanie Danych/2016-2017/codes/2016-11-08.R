### Zajęcia 8.11.2016

library('htmlTable')
library('knitr')
library('rmarkdown') ##

dane <- data.frame(
  x = sample(1:2, size = 10, rep = T),
  y = sample(1:2, size = 10, rep = T),
  z = sample(1:2, size = 10, rep = T))

htmlTable(dane)

## wskazuję gdzie zapisać
sink(file = 'tabela.html') 
### co ma być zapisane w pliku
kable(x = dane,
      format = 'html')
## koniec zapisywania
sink()

#### 

install.packages('rio')
library(rio)

dane <- import(file = 'Wizualizacja i Raportowanie Danych/2016-2017/datasets/KULT_2159_XPIV_20161108171949.xlsx', which = 'DANE')

head(dane)

colnames(dane) <- c('kod','woj',
                    'gry','os','rok',
                    'wartosc','miara',
                    'attr')

head(dane)

library('ggplot2')
library('ggthemes')

ggplot(data = dane,
       aes(
         x = rok,
         y = wartosc,
         group = woj,
         color = woj
       )) +
  geom_line() +
  facet_wrap( ~ gry)

ggplot(data = dane,
       aes(
         x = rok,
         y = wartosc,
         group = gry,
         color = gry
       )) +
  geom_line() +
  facet_wrap( ~ woj) +
  theme_void()
