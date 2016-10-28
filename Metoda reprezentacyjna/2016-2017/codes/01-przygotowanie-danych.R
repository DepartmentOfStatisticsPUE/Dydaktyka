## przygotowanie danych na zajęcia
library(dplyr)

load('~/Documents/Uczelnia/Zbiory/BKL/ludnosc/bkl_lud.rda')

bkl_2010_2014 <- bkl_lud %>% 
  filter(edycja %in% c(2010, 2014)) %>%
  select(id:eduk_lata) %>%
  mutate(jps = paste(powiat, sGUS, paste = '_'))

attr(bkl_2010_2014$jps,'label') <- 'Identyfikator jednostki losowania pierwszego stopnia'

rio::export(bkl_2010_2014, file = 'Metoda reprezentacyjna/2016-2017/data/bkl_2010_2014.sav')
save(bkl_2010_2014,file = 'Metoda reprezentacyjna/2016-2017/data/bkl_2010_2014.RData')


### tworzę słownik


slownik <- sjPlot::view_df(
  x = bkl_2010_2014,
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

tbl_df(slownik_df[[1]])

slownik_df[[1]] %>%
  select(ID:missings) %>%
  rename(nazwa_zmiennej = Name, etykieta = Label, braki_danych = missings) %>%
  DT::datatable()
