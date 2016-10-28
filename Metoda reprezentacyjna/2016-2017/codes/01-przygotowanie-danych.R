## przygotowanie danych na zajęcia
library(dplyr)

load('~/Documents/Uczelnia/Zbiory/BKL/ludnosc/bkl_lud.rda')
load('~/Documents/Uczelnia/Papers/In_preparation/Dagmara/datasets/bkl_subset.rda')


## ustalenie warstwy i jps
## podregion (66 podregionow)
## miejsce (9 klas)
## m1_plec
## wiek_4

bkl_2010_2014 <- bkl_lud %>% 
  filter(edycja %in% c(2010, 2014)) %>%
  select(respid:eduk_lata,n0) %>%
  mutate(jps = paste(powiat, sGUS, paste = '_')) %>%
  left_join(bkl_subset %>% 
              select(respid,kodpod)) %>%
  mutate(kodpod = stringi::stri_extract_last(kodpod,regex = '\\d{2}')) 

rio::export(bkl_2010_2014, file = 'Metoda reprezentacyjna/2016-2017/data/bkl_2010_2014.sav')
save(bkl_2010_2014,file = 'Metoda reprezentacyjna/2016-2017/data/bkl_2010_2014.RData')


### tworzę słownik


slownik <- sjPlot::view_df(
  x = bkl_2010_2014[,-1],
  show.values = F,
  show.frq = T,
  show.na  = T,
  show.prc = T,
  use.viewer = T,
  file = 'Metoda reprezentacyjna/2016-2017/documents/bkl_slownik_pelny.html',
  encoding = 'utf-8'
)

slownik_df <- xml2::read_html('Metoda reprezentacyjna/2016-2017/documents/bkl_slownik_pelny.html',
                encoding = 'utf-8') %>%
  rvest::html_table(header = T,
                    fill = T)

slownik_df[[1]] %>%
  select(ID:missings) %>%
  rename(nazwa_zmiennej = Name, etykieta = Label, braki_danych = missings) %>%
  DT::datatable()

# pakiet survey -----------------------------------------------------------

library(survey)

design <- svydesign(
  ids = ~sGUS,
  strata = ~edycja + wojew + kodpod + miejsce + m1_plec + wiek_4k,
  data = data.frame(bkl_2010_2014 %>% 
                      filter(!is.na(wiek_4k),!is.na(n0))),
  weights = ~waga_pop,
  nest = T
)

svytable(~n0,design = design)

df <- svyby(
  formula = ~factor(n0),
  by = ~ edycja + kodpod,
  design = design,
  FUN = svymean
) 
df


