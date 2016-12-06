data(apartments, package = 'PBImisc')
exists('apartments') ## 

m1 <- lm(formula = log(transaction.price) ~ 
           surface,
         data = apartments)

m2 <- lm(formula = log(transaction.price) ~ 
           surface + n.rooms,
         data = apartments)

m3 <- lm(formula = log(transaction.price) ~ 
           surface + n.rooms + type,
         data = apartments)


summary(m1)

sjt.lm(m1,m2,m3,
       show.ci = FALSE,
       show.se = TRUE, 
       show.aic = TRUE,
       show.aicc = TRUE)

## 
texreg(l = list(m1,m2,m3))

screenreg(l = list(m1,m2))
screenreg(l = list(m1,m2),
          single.row = T,
          file = 'regresja.txt')

screenreg(l = list(m1,m2),
          single.row = T,
          file = 'regresja.doc')

### 

podzbior <- apartments[,1:5]
datatable(podzbior)



