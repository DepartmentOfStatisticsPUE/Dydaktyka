install.packages("rio")
library("rio")
library(ggplot2)
install.packages("ggthemes")
library(ggthemes)

#importuje dane

dobry <- import(file='C:/Users/Krystynka/Desktop/WIRDS/WIRDS/datasets/danew1.xlsx', which = "wykres1")

head(dobry)


colnames(dobry) <-c('oddzial','procent')

#sortuję wartości by słupki wykresu były od najmniejszego do największego
dobry$oddzial <- factor(dobry$oddzial, levels = dobry$oddzial[order(dobry$procent)])

ggplot(data = dobry, aes(x = oddzial, y=procent)) +
  geom_bar(stat = "identity", color = "black", fill = "blue") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + #pionowo wartości osi x
  geom_text(aes(label=paste0(procent,"%")), size = 3, vjust = -0.5) + #wartości nad słupkami
  xlab('Oddziały') +
  ylab('Procent wszystkich łóżek') +
  ggtitle ('Struktura łóżek w szpitalach ogólnych \n w 2014 r. według rodzajów oddziałów') +
  ylim(0,30) #granica osi y

tw <- import(file='C:/Users/Krystynka/Desktop/WIRDS/WIRDS/datasets/bezrobocie.xlsx', which = "DANE")
head(tw)

colnames(tw) <-c('kod','nazwa','plec','rok','wart','jedn', 'atr')

ggplot(data = tw, aes(x = plec, y=wart, group = rok, fill = plec ) ) + 
  geom_bar(stat = "identity") + 
  facet_wrap(~rok) +
  theme_excel() +
  xlab('Płeć') +
  ylab('Poziom bezrobocia') +
  ggtitle ('Poziom bezrobocia w Polsce \n wśród kobiet i mężczyzn w latach 2011 - 2015')
  

