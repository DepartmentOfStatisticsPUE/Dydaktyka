### przygotowanie danych do cwiczen (Diagnoza)
library(tidyverse)
library(sjPlot)

ds <- haven::read_spss('~/Downloads/ds_0_15_ind_14112015.sav')

ds_2015 <- select(ds, 
                  Nuner_GD:PLEC_ALL,WOJEWODZTWO,
                  KLASA_MIEJSCOWOSCI, PODREGION66,
                  matches('2015'),
                  matches('^(h|H)')) %>%
  filter(WAGA_2015_IND > 0)

view_df(x = ds_2015,
        show.values = F,
        show.labels = F)

### data na zajecia

diagnoza2015 <- ds_2015 %>%
  select(Nuner_GD,NUMER_OSOBY,WOJEWODZTWO,
         KLASA_MIEJSCOWOSCI,
         HC10, HC9, HP100, HC16, HC17,
         WAGA_2015_IND, HD2, HD6,HD8,
         HP2_02,wiek2015) %>%
  rename(id_gosp = Nuner_GD,
         id_osoba = NUMER_OSOBY,
         woj = WOJEWODZTWO,
         klm = KLASA_MIEJSCOWOSCI,
         plec = HC10,
         internet = HP100,
         wiek = wiek2015,
         wyksz = HC16,
         nauka_lata = HC17,
         waga_estymacja = WAGA_2015_IND,
         czy_praca = HD2,
         czy_pelny_etat = HD6,
         czy_rej_pup = HD8,
         dzieci = HP2_02)  %>%
  filter(!is.na(id_osoba),
         !is.na(woj),
         !is.na(klm),
         !is.na(plec),
         !is.na(wiek),
         !is.na(internet),
         !is.na(czy_praca),
         !is.na(czy_rej_pup),
         !is.na(dzieci),
         !is.na(wyksz),
         !is.na(nauka_lata),
         wiek >= 15,
         wiek <= 64)  %>%
  mutate(flag_woman = 
           (wiek <= 59 & plec == 2) | (wiek <= 64 & plec == 1)) %>%
  filter(flag_woman) %>%
  mutate(czy_praca = ifelse(czy_pelny_etat %in% 1:2, 1, 2),
         czy_pelny_etat = 
           ifelse(is.nan(czy_pelny_etat),0,czy_pelny_etat)) %>%
  select(-HC9, - waga_estymacja,-flag_woman)


### etykiety
attr(diagnoza2015$plec,'label') <- 'Płeć respondenta'
attr(diagnoza2015$internet,'label') <- 'Czy korzysta z interentu?'
attr(diagnoza2015$wyksz,'label') <- 'Wykształcenie respondenta'
attr(diagnoza2015$nauka_lata,'label') <- 'Lata nauki respondenta'
attr(diagnoza2015$czy_praca,'label') <- 'Czy w ciągu ostatnich 7 dni osoba wykonywała pracę przynoszącą zarobek, dochód lub pomagała nieodpłatnie w rodzinnej działalności gospodarczej?'
attr(diagnoza2015$czy_pelny_etat,'label') <- 'Czy jest to praca w pełnym wymiarze?'
attr(diagnoza2015$czy_rej_pup,'label') <- 'Czy osoba jest zarejestrowana jako bezrobotna w urzędzie pracy?'
attr(diagnoza2015$dzieci,'label') <- 'Czy respondent ma dzieci?'
attr(diagnoza2015$wiek,'label') <- 'Wiek respondenta w 2015'

diagnoza2015 %>% 
  view_df(., 
          show.frq = T, 
          show.na = T,
          show.prc = T)

save(x = diagnoza2015, 
     file = 'Badania Internetowe/data/diagnoza2015.rdata')


