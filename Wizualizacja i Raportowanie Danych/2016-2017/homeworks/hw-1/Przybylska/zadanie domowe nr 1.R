#wykres 1 

#żródłó wykresu - http://stat.gov.pl/obszary-tematyczne/przemysl-budownictwo-srodki-trwale/srodki-trwale/srodki-trwale-w-gospodarce-narodowej-w-2014-roku,1,12.html, strona 110



dzial <- c('Wytwarzanie i zaopatrywanie w energię elektryczną - 55,5%',
           'Informacja i komunikacja - 12,8%',
           'Przetwórstwo przemysłowe - 7%',
           'Pozostałe sekcje - 6,6%',
           'Transport i gospodarka magazynowa - 5,6%',
           'Dostawa wody; gospodarowanie ściekami i odpadami - 5,1%',
           'Handel, naprawa pojazdów samochodwych - 3,4%',
           'Administracja publiczna i obrona narodowa - 2,3%',
           'Edukacja - 1,2%',
           'Opieka zdrowotna i pomoc społeczna - 0,5%'
           
)
procent <- c(55.5,
             12.8,
             7,
             6.6,
             5.6,
             5.1,
             3.4,
             2.3,
             1.2,
             0.5
)

barplot(procent, 
        legend= dzial, 
        col=rainbow(10), 
        ylab = "Procentowa wartość liczby inwestycji rozpoczętych w 2014 roku", 
        xlab = "Obszar w którym inwestycje zostały rozpoczęte w 2014 roku", 
        horiz=F,
        main = 'Prcentowa wartość liczby inwestycji rozpoczętych w 2014 roku w podziale na obszry gospodarki',
        font.lab=2,
        ylim=c(0,60)
)

#wykres 2
#źródło wykresu - http://stat.gov.pl/obszary-tematyczne/edukacja/edukacja/szkoly-wyzsze-i-ich-finanse-w-2014-r-,2,11.html , strona 33




podgrupa <- c('Biznesu i administracji - 18,8%',
              'Inżynieryjno-techniczna - 11,2%',
              'Społeczna - 10,3%',
              'Medycyna - 8,7%',
              'Pedagogiczna - 8,6%',
              'Pozostałe kierunki - 7,2%',
              'Językowa - 5,1%',
              'Architektury i budownictwa - 5%',
              'Technologii teleinformacyjnych - 4,6%',
              'Ochrony i bezpieczeństwa - 4,2%',
              'Produkcji i przetwórstwa - 4%',
              'Prawna - 3,7%',
              'Usług dla ludności - 3,1%',
              'Artystyczna - 2,3%',
              'Humanistyczna - 1,6%',
              'Fizyczna - 1,5%' )        

wartosc <- c(18.8,
             11.2,
             10.3,
             8.7,
             8.6,
             7.2,
             5.1,
             5.0,
             4.6,
             4.2,
             4.0,
             3.7,
             3.1,
             2.2,
             1.6,
             1.5)



barplot(wartosc, 
        legend= podgrupa, 
        col=rainbow(20), 
        ylab = "Podgrupy kierunków", 
        xlab = "Procentowa wartość liczby studentów", 
        horiz=T,
        main = 'Studenci według podgrup kierunków studiów zgodnie z klasyfikacją ISCED-F 2013, stan w dniu 30.XI.2014',
        font.lab=2,
        xlim=c(0,20)
)




library('rio')

library('ggthemes')

dane <- import(file = 'D:/STUDIA/STOPIEŃ II/SEMESTR 3/Wizualizacja i raportowanie dnaych statystycznych/HAND_2324_XPIV_20161108213251.xlsx', 
               which='DANE')

dim(dane)
head(dane)

library(ggplot2)

ggplot(
  data=dane,
  aes(
    x=Rok,
    y=Wartosc,
    group=Nazwa, 
    color=Nazwa))  + 
  geom_line(size=1) +
  xlab('Rok') + 
  ylab('Liczba osób przypadajaca na 1 sklep') + 
  theme_light()



daneprze <- import(file = 'D:/STUDIA/STOPIEŃ II/SEMESTR 3/Wizualizacja i raportowanie dnaych statystycznych/NAUK_2702_XPIV_20161108214742.xlsx', 
                   which='DANE')
library(ggplot2)

ggplot(
  data=daneprze,
  aes(
    x=rok,
    y=wartosc,
    group=rodzaj, 
    color=nazwa)) + 
  geom_path(size=2) +
  facet_wrap(~nazwa) + 
  theme_bw() +
  xlab('Rok') + 
  ylab('Procentowy udział przedsiębirstw w podziale na przedsiębirstwa 
       przemysłowe i usługowe wykorzystujące działalności innowacyjne ')














