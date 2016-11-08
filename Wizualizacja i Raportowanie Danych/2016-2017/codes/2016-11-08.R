### Zajęcia 8.11.2016

library('htmlTable')
library('knitr')
library('rmarkdown')

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




## Co będziemy robić na zajeciach?
### cel wykorzystania wykresów punktowych / rozrzutu
### analiza
### przetworzenie zbioru do analizy wielowymiarowej z wykorzystaniem facet_wrap

library(PBImisc)
library(ggplot2)

data(apartments)

head(apartments)

ggplot(data = apartments,
       aes(
         x = surface,
         y = transaction.price,
         group = type,
         colour = type
       )) +
  #geom_point() +
  geom_smooth(method = 'loess', se = F) +
  theme_bw()

ggplot(data = apartments,
       aes(x = floor,
           y = transaction.price)) +
  geom_point() +
  geom_smooth(method = 'loess') +
  theme_bw()  +
  scale_y_log10()
