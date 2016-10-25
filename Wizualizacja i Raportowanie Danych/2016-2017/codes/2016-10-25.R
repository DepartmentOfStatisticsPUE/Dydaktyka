## tworzymy wykresy dla zm. jakościowych

### generujemy dane
wyksz <- c('podstawowe','średnie','wyższe')

set.seed(123)
wektor <- sample(x = wyksz,
                 size = 1000,
                 replace = TRUE,
                 prob = c(0.5,0.2,0.3))

head(wektor)

### podstawowe funkcje R

barplot(table(wektor))
barplot(prop.table(table(wektor)))

### wymuszamy charakter zmiennej (porządek)

wektor_p <- factor(x = wektor, 
                   ordered = T,
                   levels = wyksz)

### tworzymy wykresy słupkowe z pakietem ggplot2

library('ggplot2')

dane <- data.frame(wyksz = wektor_p)
summary(dane)

ggplot(data = dane, aes(x = wyksz)) + 
  geom_bar(colour = 'red',
           fill = 'white') 

p1 <- ggplot(data = dane,
             aes(x = wyksz, fill = wyksz)) +
  geom_bar(color = 'black') +
  scale_fill_brewer(palette = 'OrRd')

library('RColorBrewer')
display.brewer.all()

## działamy dalej nad wykresem i poznajemy kolejne fun.

p1 <- p1 +
  coord_flip() +
  theme_minimal() +
  xlab('Wykształcenie') +
  ylab('Liczeność') +
  ggtitle('Wykształcenie w 2011 roku gdzieś tam')


#### tworzymy nowe dane
wektor <- sample(x = wyksz,
                 size = 1000,
                 replace = TRUE,
                 prob = c(0.3,0.5,0.2))
wektor_p <- factor(x = wektor, 
                   ordered = T,
                   levels = wyksz)
dane_nowe <- data.frame(wyksz = wektor_p)

#### używając %+% aktualizujemy dane
#### %+replace%
p1 %+% dane_nowe


### agregujemy dane

dane1 <- table(wektor_p)
class(dane1) ## table
dane1 <- as.data.frame(dane1)
class(dane1) ## data.frame
dane1

ggplot(data = dane1, 
       aes(x = wektor_p,
           y = Freq)) + 
  geom_bar(stat = 'identity')

#install.packages('sjPlot')
library('sjPlot')

# sjp.*  -- funkcje zaczynające się od sjp. służą do tworzenia wykresów
# sjt.* -- funkcje zaczynające się od sjt. służą do tworzenia tabel

sjp.frq(var.cnt = dane$wyksz,
        sort.frq = 'desc',
        show.n = F)

sjp.stackfrq(dane$wyksz)










