library(vcd) 
library(corrplot) 
library(ggcorrplot)
library(GGally)

data("mtcars")
head(mtcars)

plot(mtcars)

## mpg - Miles/(US) gallon
## disp - Displacement (cu.in.)
## wt - Weight 
## qsec - 1/4 mile time

mt1 <- subset(
  x = mtcars,
  select = c(mpg, disp, wt, qsec)
)

plot(mt1)
pairs(mt1)

panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y))
  txt <- format(c(r, 0.123456789), digits = digits)[1]
  txt <- paste0(prefix, txt)
  if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex.cor * r)
}

pairs(x = mt1,
      lower.panel = panel.cor,
      upper.panel = panel.smooth)

## użyjemy pakietu GGally

ggpairs(data = mt1,
        upper = list(continuous = 'smooth'),
        lower = list(continuous = 'smooth_loess'))

### wizualizacja macierzy korelacji

mat_cor <- cor(mt1, method = 'spearman')

corrplot(mat_cor, method = 'circle')
corrplot(mat_cor, method = 'square')
corrplot(mat_cor, method = 'ellipse')
corrplot(mat_cor, method = 'number')
corrplot(mat_cor, method = 'shade')

corrplot(mat_cor, method = 'ellipse',
         type = 'lower')
corrplot(mat_cor, method = 'number',
         type = 'upper')

corrplot(cor(mtcars))
corrplot(cor(mtcars), order = 'FPC')

### 

## ggcorr - w pakiecie GGally
## ggcorrplot - w pakiecie ggcorrplot
ggcorrplot(cor(mtcars))

## badamy zależności między zmiennymi
## jakosciowymi

data(apartments, package = 'PBImisc')

tabela <- xtabs(~ condition + type, 
                data = apartments)

summary(tabela)

assocstats(tabela)






