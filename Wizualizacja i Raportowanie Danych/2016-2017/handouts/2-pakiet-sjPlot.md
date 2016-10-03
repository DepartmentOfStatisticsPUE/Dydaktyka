# Pakiet sjPlot
Maciej Beręsewicz  
  



# Słowo wstępu

Materiał służy przedstawieniu pakietu `sjPlot`, który bazuje na pakiecie `ggplot2` i ma wiele predefiniowanych tabel oraz wykresów gotowych do użycia.

# Pakiet `sjPlot`

Pakiet `sjPlot` został stworzony przez Daniela Lüdecke'go i służy wizualizacji danych w badaniach społecznych. Daniel tak opisuje swój pakiet:

```
Collection of plotting and table output functions for data visualization. Results of various statistical analyses (that are commonly used in social sciences) can be visualized using this package, including simple and cross tabulated frequencies, histograms, box plots, (generalized) linear models, mixed effects models, PCA and correlation matrices, cluster analyses, scatter plots, Likert scales, effects plots of regression models (including interaction terms) and much more. This package supports labelled data.
```

`sjPlot` zawiera funkcje, które są pogrupowane według przeznaczenia:

* funkcje zaczynające się od `sjt.*` służą do prezentacji wyników w postaci tabel,
* funckej zaczynające się od `sjp.*` służą do prezentacji wyników w postaci wykresów.
* funckej zaczynające się od `sjc.*` służą do wybranych analiz statystycznych.

Dodatkowo warto używać funkcji `view_df` do podsumowania zbioru danych.

## Raporty tabelaryczne

Pakiet zawiera następujące funkcje (wybrane):

* `sjt.corr` -- podsumowanie macierzy korelacji,
* `sjt.df` -- statystyki opisowe dla zbioru danych,
* `sjt.frq` -- tabela częstości,
* `sjt.glm` -- podsumowanie uogólnionych modeli liniowych,
* `sjt.glmer` -- podsumowanie uogólnionych modeli mieszanych,
* `sjt.grpmean` -- podsumowanie średnich według grup,
* `sjt.lm` -- podsumowanie regresji liniowej,
* `sjt.lmer` -- podsumowanie liniowych mieszanych modeli,
* `sjt.mwu` -- podsumowanie testu Mann-Whitney-Test,
* `sjt.pca` -- podsumowania analizy składowych głównych,
* `sjt.stackfrq` -- tabela częstości dwuwymiarowa (do 100%),
* `sjt.xtab` -- podsumowanie dla tabel krzyżowych.

## Wizualizacja danych

 
