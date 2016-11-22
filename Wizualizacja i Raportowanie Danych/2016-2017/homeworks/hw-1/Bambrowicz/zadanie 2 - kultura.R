install.packages('readxl')
library('readxl')

install.packages('ggthemes')
library('ggthemes')


##pierwszy dataset - kultura
kultura<- read_excel(path='R/datasets/kultura.xlsx',
                  sheet = 'DANE')
colnames(kultura)<-c('kod','woj','typ','rok','wartosc','jednostka','attr')
head(kultura)

##drugi dataset - stan ludnosci
ludnosc<- read_excel(path='R/datasets/ludnosc.xlsx',
                     sheet = 'DANE')

colnames(ludnosc)<-c('kod','woj','wiek','plec','rok','ludnosc','jednostka','attr')
head(ludnosc)

##dataset z mapowaniem nazw
mapa<- read_excel(path='R/datasets/mapa.xlsx',
                     sheet = 'DANE')
head(mapa)




##nowy dataset - join w sql

install.packages('sqldf')
library('sqldf')
dane<- sqldf("SELECT distinct k.rok as rok,k.woj as woj,skrot,
      'tys_os_na_kino' as typ ,
      MAX(l.ludnosc)/1000/SUM(case when k.typ='kina' then k.wartosc end) as wartosc
      FROM kultura k 
      left outer join ludnosc l on l.rok = k.rok and  l.woj=k.woj 
      left outer join mapa m on m.nazwa=k.woj 
      group by k.rok,k.woj,m.skrot
      UNION
      SELECT distinct k.rok,k.woj,m.skrot,
      'miejsca na kino' as typ ,
      SUM(case when k.typ<>'kina' then k.wartosc end)/SUM(case when k.typ='kina' then k.wartosc end)
      FROM kultura k 
      left outer join mapa m on m.nazwa=k.woj 
      group by k.rok,k.woj,m.skrot

/*      UNION
      SELECT distinct k.rok,k.woj,m.skrot,
      'miejsca na widowni' as typ ,
      SUM(case when k.typ<>'kina' then k.wartosc end)
      FROM kultura k 
      left outer join mapa m on m.nazwa=k.woj 
      group by k.rok,k.woj,m.skrot*/
       ")
head(dane)


library('ggplot2')

ggplot(data=dane,
       aes(
         x=rok,
         y=wartosc,
         group=typ,
         color=typ) )+ geom_line() +
  facet_wrap(~skrot)








