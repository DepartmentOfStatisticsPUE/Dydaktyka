library('PBImisc')
library('dplyr')
library('ggplot2')
library('zoo')
library('tidyr')

data("apartments")
head(apartments)

wynik <- count(apartments, year, month)
wynik <- mutate(wynik,
                ym = paste(year,month,sep = '-'))

ggplot(data = wynik,
       aes(x = ym,
           y = n)) +
  geom_point()

ggplot(data = wynik,
       aes(x = ym,
           y = n,
           group = 1)) +
  geom_line()

## dodaję zmienną określającą czas
wynik <- mutate(wynik,
                czas = as.yearmon(ym))

head(wynik)

ggplot(data = wynik,
       aes(x = czas,
           y = n,
           group = 1)) +
  geom_line() +
  scale_x_yearmon(format = '%Y/%m',
                  n = 10)

### pozbywamy się grupowania
wynik <- ungroup(wynik)

wynik <- complete(wynik, year, month)
wynik <- mutate(wynik,
                ym = paste(year,month,sep = '-'),
                czas = as.yearmon(ym))

ggplot(data = wynik,
       aes(x = czas,
           y = n,
           group = 1)) +
  geom_line() +
  scale_x_yearmon(format = '%Y/%m')


####### tworzymy wykres rozrzutu

# dodajemy zmienną określającą liczbę pokoi
apartments <- mutate(apartments,
                     pokoje = ifelse(n.rooms>=4,4,n.rooms))

# wyliczam ile mieszkań było sprzedanych
wynik <- count(apartments, year, pokoje)
wynik <- na.omit(wynik)
wynik <- mutate(wynik, p = n / sum(n))

# wybieram rok 2008
rok_07_09 <- filter(wynik, year != 2008)
rok_07_09 <- select(rok_07_09, -n)

# przetwarzam dane do odpowiedniego formatu
rok_07_09 <- spread(rok_07_09, year, p)

# wykres rozrzutu porównania roku 2007 do 2009
ggplot(data = rok_07_09,
       aes(x = `2007`,
           y = `2009`,
           label = pokoje)) +
  geom_point() +
  geom_text(nudge_x = 0.02) +
  geom_abline(intercept = 0,
              slope = 1,
              col = 'red') +
  coord_fixed(xlim = c(0,0.5),
              ylim = c(0,0.5)) 




