# wprowadzenie do R

dane <- read.csv(
  file = 'Wizualizacja i Raportowanie Danych/2016-2017/datasets/ciekawe_dane.csv',
  header = FALSE)

dim(dane) # l. wierszy / l. kolumn

head(dane) # pierwsze 6 wierszy

summary(dane) 

table(dane$V1)

table(round(dane$V1))

## podstawowe wykresy w R

hist(dane$V1) # tworzymy histogram
plot(density(dane$V1)) # tworzymy wykres gęstości
boxplot(dane$V1) # wykres pudełkowy
plot(dane$V1)
plot(dane) # plot(dane$V1, dane$V2)
#  with(plot(V1,V2),dane)

install.packages('ggplot2')
library('ggplot2')


# tworzymy wykres punktowy (rozrzutu)

ggplot(data = dane,
             mapping = aes(x = V1,
                     y = V2,
                     color = V1,
                     size = V2))  + 
  geom_point() + 
  theme_bw() +
  scale_color_continuous(low = 'white',
                         high = 'red',
                         name = 'Kolor') +
  xlab('Oś X') +
  ylab('Oś Y')

# labs(x = 'cos', y = 'cos')

## przypisuję wykres do obiektu p1


p1 <- ggplot(data = dane,
             mapping = aes(x = V1,
                           y = V2,
                           color = V1,
                           size = V2))  +
  geom_point() +
  theme_bw() +
  scale_color_continuous(low = 'white',
                         high = 'red',
                         name = 'Kolor') +
  xlab('Oś X') +
  ylab('Oś Y')

plot(p1)

ggsave(filename = 'Wizualizacja i Raportowanie Danych/2016-2017/plots/dinozaur-2.png',
       plot = p1,
       width = 15,
       height = 10,
       units = 'cm')


p1 + geom_smooth(method = 'lm',
                 se = F)






