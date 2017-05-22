#Zadanie domowe
#Wykonali: Artur Basiński, Kamil Jankowski

#Wczytywanie danych
library(readxl)
dane <- read_excel(path = 'populacja.xlsx', sheet = 1)

#podstawowe informacje o danych
summary(dane$N)


#sprawdzamy ile jest kobiet (0) i mężczyzn(1)
tabela_plec <- table(dane$plec)
tabela_plec

#obie grupy sa rowne - 256 kobiet, 256 mezczyzn

#sprawdzamy wojewodztwa
tabela_woj <- table(dane$woj.)
tabela_woj

#kazde wojewodztwo zawiera po 32 wartosci, dane dla 4 lat, a wiec 32/4 = 8 obserwacji na 1 rok

tabela_wiek <- table(dane$wiek)
tabela_wiek

#4 grupy wiekowe


tabela_N <- (dane$N)
#podstawowe informacje o wartosci N dla lat 2011 - 2014
summary(tabela_N)




#tworzymy wykres dla lat 2011 - 2014 z laczna wartoscia N dla kazdego wojewodztwa
library(ggplot2)

ggplot(dane, aes(dane$woj., dane$N)) +
  geom_segment(aes(xend = dane$woj., yend = 0), size = 5, colour ="red", lineend = "butt")

#najwieksze wartosci w mazowieckim i slaskim, a najmniejsze w lubuskim i opolskim


#tworzymy wykres dla lat 2011 - 2014 z laczna wartoscia N dla kazdej grupy wiekowej
ggplot(dane, aes(dane$wiek, dane$N)) +
  geom_segment(aes(xend = dane$wiek, yend = 0), size = 10, colour ="red", lineend = "butt")

#najwieksza wartosc N" zanotowano w grupie 3, pozniej 4, 2 i na koncu 1



#tworzymy wykres dla lat 2011 - 2014 z laczna wartoscia N dla kazdego roku
ggplot(dane, aes(dane$edycja, dane$N)) +
  geom_segment(aes(xend = dane$edycja, yend = 0), size = 10, colour ="red", lineend = "butt")

#najwieksza wartosc N w 2014 i 2013, niewiele mniej mial 2012, zas najmniejsza wartosc w 2011
#sprawdzamy dokladnie co bylo wieksze - 2013 czy 2014

#2013
wiek3 <- subset(dane, edycja == "2013")
summary(wiek3)


#2014
wiek4 <- subset(dane, edycja == "2014")
summary(wiek4)


# 192752 > 191326, a więc największe wartosci byly w 2013


#Robimy dalej analize

#dzielimy dane na poszczegole lata - 2011, 2012, 2013 oraz 2014

dane2011 <- dane[dane$edycja == 2011, ]
dane2011

dane2012 <- dane[dane$edycja == 2012, ]
dane2012

dane2013 <- dane[dane$edycja == 2013, ]
dane2013

dane2014 <- dane[dane$edycja == 2014, ]
dane2014

#podzial na plec

kobieta <- dane[dane$plec == 0, ]
kobieta

mezczyzna <- dane[dane$plec == 1, ]
mezczyzna



#Analiza zmiennej N
#Rok badania - plec
#Plec - mezczyzna


#2011 - 2014
sr20112014 <- subset(dane, plec == 0)
summary(sr20112014)
#srednia - 200030


#2011
sr2011 <- subset(dane, edycja == "2011" & plec == 0)
summary(sr2011)
#srednia - 198688

198688/200030
100-99.3291
#roznica = 0,67%


#2012
sr2012 <- subset(dane, edycja == "2012" & plec == 0)
summary(sr2012)
#srednia - 199689
199689/200030
100-99.82953
#roznica = 0,17%


#2013
sr2013 <- subset(dane, edycja == "2013" & plec == 0)
summary(sr2013)
#srednia - 200920
200920/200030
100-100.4449
#roznica = 0,44%


#2014
sr2014 <- subset(dane, edycja == "2014" & plec == 0)
summary(sr2014)
#srednia - 200825
200825/200030
100-100.3974
#roznica = 0,40%


#Analiza zmiennej N
#Rok badania - plec
#Plec - mezczyzna


#2011 - 2014
sr20112014M <- subset(dane, plec == 1)
summary(sr20112014M)
#srednia - 184498


#2011
sr2011M <- subset(dane, edycja == "2011" & plec == 1)
summary(sr2011M)
#srednia - 186292

186292/184498
100-100.9724
#roznica = 0,97%


#2012
sr2012M <- subset(dane, edycja == "2012" & plec == 1)
summary(sr2012M)
#srednia - 185290
185290/184498
100-100.4293
#roznica = 0,43%


#2013
sr2013M <- subset(dane, edycja == "2013" & plec == 1)
summary(sr2013M)
#srednia - 184584
200920/184498
100-100.89009
#roznica = 0,89%


#2014
sr2014M <- subset(dane, edycja == "2014" & plec == 1)
summary(sr2014M)
#srednia - 181827
181827/184498
100-98.55229
#roznica = 1,45%


#Analiza zmiennej N
#Rok badania - wiek

#srednia 2011 - 2014
wiek <- subset(dane)
summary(wiek)
#srednia 192264


#2011
wiek1 <- subset(dane, edycja == "2011")
summary(wiek1)
192490/192264
100-100.12
#roznica - 0,12%


#2012
wiek2 <- subset(dane, edycja == "2012")
summary(wiek2)
192490/192264
100-100.12
#roznica - 0,12%


#2013
wiek3 <- subset(dane, edycja == "2013")
summary(wiek3)
192752/192264
100-100.25
#roznica - 0,25%


#2014
wiek4 <- subset(dane, edycja == "2014")
summary(wiek4)
191326/192264
100-99.51
#roznica - 0,49%


