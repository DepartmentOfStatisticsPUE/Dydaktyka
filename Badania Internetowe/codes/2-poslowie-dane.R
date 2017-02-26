### info o posłach w sejmie

library(rvest)
library(stringi)
library(httr)
library(dplyr)

poslowie <- 'http://www.sejm.gov.pl/Sejm8.nsf/poslowie.xsp' %>%
  html_session() %>%
  read_html() %>%
  html_nodes('ul.deputies li')

poslowie %>%
  html_nodes('div.deputyName') %>% 
  html_text()

names <- poslowie %>%
  html_nodes('div.deputyName') %>% 
  html_text()

party <- poslowie %>%
  html_nodes('div > strong') %>% 
  html_text()

posel_links <- poslowie %>%
  html_node('a') %>% 
  html_attr('href') %>%
  stri_paste('http://www.sejm.gov.pl',.)

deputies <- data.frame(names = names,
                       party = party,
                       posel_links = posel_links)

get_deputy_details <- function(url) {
  deputy <- html_session(url) 
  
  demo_vars <- deputy %>%
    read_html() %>% 
    html_nodes('ul.data li p.left') %>%
    html_text() %>% 
    stri_trans_tolower() %>% 
    stri_trans_general(., "Latin-ASCII") %>% 
    stri_replace_all(str = ., regex = ':', rep ='') %>%
    stri_replace_all(str = ., regex = '\\s+', rep ='_')
  
  demo_vals <- deputy %>%
    read_html() %>% 
    html_nodes('ul.data li p.right') %>%
    html_text()
  
  df <- data.frame(matrix(ncol = length(demo_vars), nrow = 1, data = demo_vals))
  colnames(df) <- demo_vars

  return(df)
}

deputies_details <- lapply(deputies$posel_links,get_deputy_details)

deputies <- bind_cols(deputies, bind_rows(deputies_details))

save(deputies,file='Badania Internetowe/data-raw/poslowie.rda')

## http://orka.sejm.gov.pl/SQL.nsf/raktywnosc?OpenAgent&8

get_activity <- function(url) {
  doc <- html_session('http://orka.sejm.gov.pl/SQL.nsf/raktywnosc?OpenAgent&8')
  
  wystapienia <- doc %>%
    follow_link('Wystąpienia na posiedzeniach Sejmu') %>%
    html_table() %>%
    .[[2]]
  
  interpelacje <- doc %>%
    follow_link('Interpelacje') %>%
    html_table() %>%
    .[[2]]
  
  zapytania <- doc %>%
    follow_link('Wystąpienia na posiedzeniach Sejmu') %>%
    html_table() %>%
    .[[2]]
  
  pytania <- doc %>%
    follow_link('Zapytania') %>%
    html_table() %>%
    .[[2]]
  
  oswiadczenia <- doc %>%
    follow_link('Oświadczenia') %>%
    html_table() %>%
    .[[2]]
  
  podpisy <- doc %>%
    follow_link('Podpisy pod projektami poselskimi') %>%
    html_table() %>%
    .[[2]]
  
  udzial_glosowania <- doc %>%
    follow_link('Udział w głosowaniach') %>%
    html_table(fill = T) %>%
    .[[2]]
  
  
}