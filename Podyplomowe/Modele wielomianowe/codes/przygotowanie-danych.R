## przygotowanie
library(dplyr)
library(sjPlot)
library(mlogit)
library(mnlogit)
library(haven)

load('data/osoby.rda')

dane_do_analizy <- osoby %>% 
  tbl_df() %>%
  select(numer150730:h_zawod_ogolem_skr,starts_with('h')) %>%
  mutate(bank = ifelse(hp104 %in% c(15,6,4,7,12,NA),hp104,0)) %>%
  filter(!is.na(bank)) %>%
  select(bank,
         wojewodztwo,
         klasa_miejscowosci,
         plec_all,
         wiek2015,
         l_osob_2015,
         eduk4_2015,
         hc11,
         htyp_gd_8)  %>%
  na.omit() %>%
  filter(wiek2015 >=15) %>%
  rename(klm = klasa_miejscowosci,
         plec = plec_all,
         wiek = wiek2015,
         wielkosc_gosp = l_osob_2015,
         edukacja = eduk4_2015,
         stan_cywilny = hc11,
         typ_gosp = htyp_gd_8) %>%
  mutate(stan_cywilny = ifelse(stan_cywilny == 6,5, stan_cywilny),
    bank = factor(x = bank,
                       levels = c(0,4,6,7,12,15),
                       labels = c('inny','PEKAO SA','SPÓŁDZIELCZY',
                                  'BZWBK','ING','PKO BP')),
         klm = factor(x = klm,
                      levels = 1:6,
                      labels = c('500+','200-500','100-200','20-100','20-','wies')),
         edukacja = factor(x = edukacja,
                           levels = 1:4,
                           labels = c('podstawowe i nizsze',
                                      'zasadnicze/gim',
                                      'średnie',
                                      'wyższe i policealne')),
         stan_cywilny = factor(x = stan_cywilny,
                               levels = 1:5,
                               labels = c('kawaler/panna',
                                          'żonaty/zameżna',
                                          'wdowiec/wdowa',
                                          'rozwiedziony/a',
                                          'separacja')),
         typ_gosp = factor(x = typ_gosp,
                           levels = 1:8,
                           labels = c('mał bez dzieci',
                                      'mał z 1',
                                      'mał z 2',
                                      'mał z 3+',
                                      'rodzina niepełna',
                                      'wielorodzinne',
                                      'nierodzinne jednoosob',
                                      'nierodzinne wieloosob')),
    wojewodztwo = factor(x = wojewodztwo,
                         levels  = seq(2,32,2),
                         labels = c('Dolnośląskie','Kujawsko-Pomorskie',
                                    'Lubelskie','Lubuskie','Łódzkie',
                                    'Małopolskie','Mazowieckie','Opolskie',
                                    'Podkarpackie','Podlaskie','Pomorskie',
                                    'Śląskie','Świętokrzyskie',
                                    'Warmińsko-Mazurskie','Wielkopolskie',
                                    'Zachodniopomorskie')),
    plec = factor(x = plec,
                  levels = 1:2,
                  labels = c('mężczyzna','kobieta')))

### for export


dane_do_analizy_export <- dane_do_analizy %>%
  mutate_each(funs(as.numeric))

## opis danych

attr(dane_do_analizy$bank,'label') <- 'Bank w którym ma konto'
attr(dane_do_analizy$wojewodztwo,'label') <- 'Województwo zamieszkania'
attr(dane_do_analizy$klm,'label') <- 'Wielkość miejscowości'
attr(dane_do_analizy$plec,'label') <- 'Płeć respondenta'
attr(dane_do_analizy$wiek,'label') <- 'Wiek respondenta'
attr(dane_do_analizy$wielkosc_gosp,'label') <- 'Wielkosc gospodarstwa'
attr(dane_do_analizy$edukacja,'label') <- 'Edukacja (4 poziomy)'
attr(dane_do_analizy$stan_cywilny,'label') <- 'Stan cywilny respodenta'
attr(dane_do_analizy$typ_gosp,'label') <- 'Typ biologiczny gospodarstwa domowego'

view_df(dane_do_analizy, show.values = F, show.frq = T)

save(dane_do_analizy,
     dane_do_analizy_export,
     file = '~/Documents/Uczelnia/Dydaktyka/Podyplomowe/Modele wielomianowe/dane-R.rda')

write_sas(data = dane_do_analizy,
          path = '~/Documents/Uczelnia/Dydaktyka/Podyplomowe/Modele wielomianowe/dane-banki.sas7bdat')

write.csv2(x = dane_do_analizy_export,
           file = '~/Documents/Uczelnia/Dydaktyka/Podyplomowe/Modele wielomianowe/dane-banki.csv')

### przeprowadzę analize w mlogit

dane_do_modelu <- mlogit.data(dane_do_analizy, 
                              choice = 'bank', 
                              shape = 'wide')



head(dane_do_modelu, n = 10)


model1 <- mlogit(bank ~ 0 |  wojewodztwo, 
                 data = dane_do_modelu,
                 reflevel = 'inny')

mnlogit(formula = bank ~ 0 |  wojewodztwo | 0,
        data = dane_do_modelu)

