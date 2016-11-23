# Zestawienia tabelaryczne
Maciej Beręsewicz  
11/23/2016  



## Wprowadzenie

Na zajeciach dowiemy się w jaki sposób tworzyć zestawienia tabelaryczne oraz jak zautomatyzować proces ich powstawania. Poznamy kilka przydatnych pakietów R, które umożliwią nam sprawne tworzenie tabel.

Aby stworzyć zestawieniam możemy wykorzystać nastepujące pakiety


```r
# install.packages(c('sjPlot'))
library(sjPlot) ## kolekcja przydatnych funkcji do tworzenia zestawień
```

```
## Visit http://strengejacke.de/sjPlot for package-vignettes.
```

```r
library(sjmisc)
#library(tables) ## pakiet do tworzenia tabel
library(htmlTable) ## pakiet do tworzenia tabel w HTML
library(DT) ## pakiet do tworzenia tabel w JavaScript (DataTables)
library(texreg) ## pakiet zawierający funkcje do raportowania wyników regresji
```

```
## Version:  1.36.18
## Date:     2016-10-22
## Author:   Philip Leifeld (University of Glasgow)
## 
## Please cite the JSS article in your publications -- see citation("texreg").
```


```r
data(efc,package = 'sjmisc')
```

## Pakiet sjPlot

W pakiecie `sjPlot` funkcje odpowiedzialne za tworzenie tabel rozpoczynają się od `sjt`. Poniżej przedstawię kilka przykładów

### Tabela częstości


```r
sjt.frq(data = efc$e42dep)
```

<table style="border-collapse:collapse; border:none;">
 <caption style="font-weight: bold; text-align:left;">elder's dependency</caption>
 <tr>
 <th style="border-top:double; text-align:center; font-style:italic; font-weight:normal; padding-left:0.2cm; padding-right:0.2cm; border-bottom:1px solid; ">value</th>
 <th style="border-top:double; text-align:center; font-style:italic; font-weight:normal; padding-left:0.2cm; padding-right:0.2cm; border-bottom:1px solid;">N</th>
 <th style="border-top:double; text-align:center; font-style:italic; font-weight:normal; padding-left:0.2cm; padding-right:0.2cm; border-bottom:1px solid;">raw %</th>
 <th style="border-top:double; text-align:center; font-style:italic; font-weight:normal; padding-left:0.2cm; padding-right:0.2cm; border-bottom:1px solid;">valid %</th>
 <th style="border-top:double; text-align:center; font-style:italic; font-weight:normal; padding-left:0.2cm; padding-right:0.2cm; border-bottom:1px solid;">cumulative %</th>
 </tr>

 <tr>
 <td style="padding:0.2cm; text-align:left; ">independent</td>
 <td style="padding:0.2cm; text-align:center;">66</td>
 <td style="padding:0.2cm; text-align:center;">7.27</td>
 <td style="padding:0.2cm; text-align:center;">7.33</td>
 <td style="padding:0.2cm; text-align:center;">7.33</td>
 </tr>
 
 <tr>
 <td style="padding:0.2cm; text-align:left; ">slightly dependent</td>
 <td style="padding:0.2cm; text-align:center;">225</td>
 <td style="padding:0.2cm; text-align:center;">24.78</td>
 <td style="padding:0.2cm; text-align:center;">24.97</td>
 <td style="padding:0.2cm; text-align:center;">32.30</td>
 </tr>
 
 <tr>
 <td style="padding:0.2cm; text-align:left; ">moderately dependent</td>
 <td style="padding:0.2cm; text-align:center;">306</td>
 <td style="padding:0.2cm; text-align:center;">33.70</td>
 <td style="padding:0.2cm; text-align:center;">33.96</td>
 <td style="padding:0.2cm; text-align:center;">66.26</td>
 </tr>
 
 <tr>
 <td style="padding:0.2cm; text-align:left; ">severely dependent</td>
 <td style="padding:0.2cm; text-align:center;">304</td>
 <td style="padding:0.2cm; text-align:center;">33.48</td>
 <td style="padding:0.2cm; text-align:center;">33.74</td>
 <td style="padding:0.2cm; text-align:center;">100.00</td>
 </tr>
 
 <tr>
 <td style="padding:0.2cm; text-align:left; border-top:1px solid; border-bottom:double; ">missings</td>
 <td style="padding:0.2cm; text-align:center; border-top:1px solid; border-bottom:double;">7</td>
 <td style="padding:0.2cm; text-align:center; border-top:1px solid; border-bottom:double;">0.77</td>
 <td style="padding:0.2cm; border-top:1px solid; border-bottom:double;"></td>
 <td style="padding:0.2cm; border-top:1px solid; border-bottom:double;"></td>
 </tr>
<tr>
<td style="padding:0.2cm; text-align:right; font-style:italic; font-size:0.9em; padding-top:0.1cm; padding-bottom:0.1cm;" colspan="5">total N=908 &middot; valid N=901 &middot; x&#772;=2.94 &middot; &sigma;=0.94</td>
 </tr>
 </table>

### Tabela korelacji


```r
sjt.corr(data = efc[,c('c82cop1','c83cop2','c84cop3','c85cop4')],
         corr.method = 'spearman',
         triangle = 'both',
         fade.ns = FALSE)
```

<table style="border-collapse:collapse; border:none;">
<tr>
<th style="font-style:italic; font-weight:normal; border-top:double black; border-bottom:1px solid black; padding:0.2cm;">&nbsp;</th>
<th style="font-style:italic; font-weight:normal; border-top:double black; border-bottom:1px solid black; padding:0.2cm;">do you feel you cope well as caregiver?</th>
<th style="font-style:italic; font-weight:normal; border-top:double black; border-bottom:1px solid black; padding:0.2cm;">do you find caregiving too demanding?</th>
<th style="font-style:italic; font-weight:normal; border-top:double black; border-bottom:1px solid black; padding:0.2cm;">does caregiving cause difficulties in<br>your relationship with your friends?</th>
<th style="font-style:italic; font-weight:normal; border-top:double black; border-bottom:1px solid black; padding:0.2cm;">does caregiving have negative effect on<br>your physical health?</th>
</tr>
<tr>
<td style="font-style:italic;">do you feel you cope well as caregiver?</td>
<td style="padding:0.2cm; text-align:center;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center;">-0.414<span style="vertical-align:super;font-size:0.8em;">***</span></td>
<td style="padding:0.2cm; text-align:center;">-0.227<span style="vertical-align:super;font-size:0.8em;">***</span></td>
<td style="padding:0.2cm; text-align:center;">-0.272<span style="vertical-align:super;font-size:0.8em;">***</span></td>
</tr>
<tr>
<td style="font-style:italic;">do you find caregiving too demanding?</td>
<td style="padding:0.2cm; text-align:center;">-0.414<span style="vertical-align:super;font-size:0.8em;">***</span></td>
<td style="padding:0.2cm; text-align:center;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center;">0.353<span style="vertical-align:super;font-size:0.8em;">***</span></td>
<td style="padding:0.2cm; text-align:center;">0.438<span style="vertical-align:super;font-size:0.8em;">***</span></td>
</tr>
<tr>
<td style="font-style:italic;">does caregiving cause difficulties in<br>your relationship with your friends?</td>
<td style="padding:0.2cm; text-align:center;">-0.227<span style="vertical-align:super;font-size:0.8em;">***</span></td>
<td style="padding:0.2cm; text-align:center;">0.353<span style="vertical-align:super;font-size:0.8em;">***</span></td>
<td style="padding:0.2cm; text-align:center;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center;">0.386<span style="vertical-align:super;font-size:0.8em;">***</span></td>
</tr>
<tr>
<td style="font-style:italic;">does caregiving have negative effect on<br>your physical health?</td>
<td style="padding:0.2cm; text-align:center;">-0.272<span style="vertical-align:super;font-size:0.8em;">***</span></td>
<td style="padding:0.2cm; text-align:center;">0.438<span style="vertical-align:super;font-size:0.8em;">***</span></td>
<td style="padding:0.2cm; text-align:center;">0.386<span style="vertical-align:super;font-size:0.8em;">***</span></td>
<td style="padding:0.2cm; text-align:center;">&nbsp;</td>
</tr>
<tr>
<td colspan="5" style="border-bottom:double black; border-top:1px solid black; font-style:italic; font-size:0.9em; text-align:right;">Computed correlation used spearman-method with listwise-deletion.</td>
</tr>
 
</table>


### Tabela raportu regresji liniowej


```r
# zmienne jakościowe jakościowa
efc$c172code <- to_factor(efc$c172code)
efc$e42dep <- to_factor(efc$e42dep)

# pierwszy model
fit1 <- lm(neg_c_7 ~ c160age + c172code + c161sex, data = efc)
# drugi model
fit2 <- lm(neg_c_7 ~ c160age + c172code + c161sex + c12hour, data = efc)
# trzeci model
fit3 <- lm(neg_c_7 ~ c160age + c172code + e42dep + tot_sc_e, data = efc)

sjt.lm(fit1, fit2, fit3)
```



```
## Fitted models have different coefficients. Grouping may not work properly. Set `group.pred = FALSE` if you encouter cluttered labelling.
```

<table style="border-collapse:collapse; border:none;border-bottom:double;">
<td style="padding:0.2cm; border-top:double;">&nbsp;</td>
<td style="border-bottom:1px solid; padding-left:0.5em; padding-right:0.5em; border-top:double;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; border-bottom:1px solid; border-top:double;" colspan="3">Negative impact with 7 items</td>
<td style="border-bottom:1px solid; padding-left:0.5em; padding-right:0.5em; border-top:double;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; border-bottom:1px solid; border-top:double;" colspan="3">Negative impact with 7 items</td>
<td style="border-bottom:1px solid; padding-left:0.5em; padding-right:0.5em; border-top:double;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; border-bottom:1px solid; border-top:double;" colspan="3">Negative impact with 7 items</td>
</tr>
<tr>
<td style="padding:0.2cm; font-style:italic;">&nbsp;</td>
<td style="padding-left:0.5em; padding-right:0.5em; font-style:italic;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; font-style:italic; ">B</td>
<td style="padding:0.2cm; text-align:center; font-style:italic; ">CI</td>
<td style="padding:0.2cm; text-align:center; font-style:italic; ">p</td>
<td style="padding-left:0.5em; padding-right:0.5em; font-style:italic;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; font-style:italic; ">B</td>
<td style="padding:0.2cm; text-align:center; font-style:italic; ">CI</td>
<td style="padding:0.2cm; text-align:center; font-style:italic; ">p</td>
<td style="padding-left:0.5em; padding-right:0.5em; font-style:italic;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; font-style:italic; ">B</td>
<td style="padding:0.2cm; text-align:center; font-style:italic; ">CI</td>
<td style="padding:0.2cm; text-align:center; font-style:italic; ">p</td> 
</tr>
<tr>
<td style="padding:0.2cm; border-top:1px solid; text-align:left;">(Intercept)</td>
<td style="padding-left:0.5em; padding-right:0.5em; border-top:1px solid; ">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; border-top:1px solid; ">8.40</td>
<td style="padding:0.2cm; text-align:center; border-top:1px solid; ">6.72&nbsp;&ndash;&nbsp;10.08</td>
<td style="padding:0.2cm; text-align:center; border-top:1px solid; "><b>&lt;.001</b></td>
<td style="padding-left:0.5em; padding-right:0.5em; border-top:1px solid; ">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; border-top:1px solid; ">9.18</td>
<td style="padding:0.2cm; text-align:center; border-top:1px solid; ">7.53&nbsp;&ndash;&nbsp;10.83</td>
<td style="padding:0.2cm; text-align:center; border-top:1px solid; "><b>&lt;.001</b></td>
<td style="padding-left:0.5em; padding-right:0.5em; border-top:1px solid; ">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; border-top:1px solid; ">8.48</td>
<td style="padding:0.2cm; text-align:center; border-top:1px solid; ">6.99&nbsp;&ndash;&nbsp;9.97</td>
<td style="padding:0.2cm; text-align:center; border-top:1px solid; "><b>&lt;.001</b></td>
</tr>
<tr>
<td style="padding:0.2cm; text-align:left;">carer' age</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.04</td>
<td style="padding:0.2cm; text-align:center; ">0.02&nbsp;&ndash;&nbsp;0.06</td>
<td style="padding:0.2cm; text-align:center; "><b>&lt;.001</b></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.01</td>
<td style="padding:0.2cm; text-align:center; ">&#45;0.01&nbsp;&ndash;&nbsp;0.03</td>
<td style="padding:0.2cm; text-align:center; ">.306</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.01</td>
<td style="padding:0.2cm; text-align:center; ">&#45;0.01&nbsp;&ndash;&nbsp;0.03</td>
<td style="padding:0.2cm; text-align:center; ">.384</td>
</tr>
<tr>

<td style="padding:0.2cm;" colspan="13">carer's level of education</td>
</tr>
<tr>
<td style="font-style:italic; padding:0.2cm; padding-left:0.6cm; text-align:left;">intermediate level of education</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.16</td>
<td style="padding:0.2cm; text-align:center; ">&#45;0.52&nbsp;&ndash;&nbsp;0.83</td>
<td style="padding:0.2cm; text-align:center; ">.652</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.12</td>
<td style="padding:0.2cm; text-align:center; ">&#45;0.54&nbsp;&ndash;&nbsp;0.78</td>
<td style="padding:0.2cm; text-align:center; ">.728</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.08</td>
<td style="padding:0.2cm; text-align:center; ">&#45;0.56&nbsp;&ndash;&nbsp;0.72</td>
<td style="padding:0.2cm; text-align:center; ">.806</td>
</tr>
<tr>
<td style="font-style:italic; padding:0.2cm; padding-left:0.6cm; text-align:left;">high level of education</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.79</td>
<td style="padding:0.2cm; text-align:center; ">&#45;0.05&nbsp;&ndash;&nbsp;1.64</td>
<td style="padding:0.2cm; text-align:center; ">.066</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.91</td>
<td style="padding:0.2cm; text-align:center; ">0.09&nbsp;&ndash;&nbsp;1.74</td>
<td style="padding:0.2cm; text-align:center; "><b>.030</b></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.52</td>
<td style="padding:0.2cm; text-align:center; ">&#45;0.28&nbsp;&ndash;&nbsp;1.32</td>
<td style="padding:0.2cm; text-align:center; ">.203</td>
</tr>
<tr>
<td style="padding:0.2cm; text-align:left;">carer's gender</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.70</td>
<td style="padding:0.2cm; text-align:center; ">0.09&nbsp;&ndash;&nbsp;1.32</td>
<td style="padding:0.2cm; text-align:center; "><b>.025</b></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.59</td>
<td style="padding:0.2cm; text-align:center; ">&#45;0.01&nbsp;&ndash;&nbsp;1.19</td>
<td style="padding:0.2cm; text-align:center; ">.053</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; ">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
</tr>
<tr>
<td style="padding:0.2cm; text-align:left;">average number of hours of care per week</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; ">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.02</td>
<td style="padding:0.2cm; text-align:center; ">0.01&nbsp;&ndash;&nbsp;0.02</td>
<td style="padding:0.2cm; text-align:center; "><b>&lt;.001</b></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; ">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
</tr>
<tr>

<td style="padding:0.2cm;" colspan="13">elder's dependency</td>
</tr>
<tr>
<td style="font-style:italic; padding:0.2cm; padding-left:0.6cm; text-align:left;">slightly dependent</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; ">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; ">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">1.18</td>
<td style="padding:0.2cm; text-align:center; ">0.16&nbsp;&ndash;&nbsp;2.20</td>
<td style="padding:0.2cm; text-align:center; "><b>.024</b></td>
</tr>
<tr>
<td style="font-style:italic; padding:0.2cm; padding-left:0.6cm; text-align:left;">moderately dependent</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; ">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; ">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">2.53</td>
<td style="padding:0.2cm; text-align:center; ">1.53&nbsp;&ndash;&nbsp;3.52</td>
<td style="padding:0.2cm; text-align:center; "><b>&lt;.001</b></td>
</tr>
<tr>
<td style="font-style:italic; padding:0.2cm; padding-left:0.6cm; text-align:left;">severely dependent</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; ">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; ">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">4.32</td>
<td style="padding:0.2cm; text-align:center; ">3.31&nbsp;&ndash;&nbsp;5.33</td>
<td style="padding:0.2cm; text-align:center; "><b>&lt;.001</b></td>
</tr>
<tr>
<td style="padding:0.2cm; text-align:left;">Services for elderly</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; ">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; ">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.21</td>
<td style="padding:0.2cm; text-align:center; ">0.01&nbsp;&ndash;&nbsp;0.41</td>
<td style="padding:0.2cm; text-align:center; "><b>.042</b></td>
</tr>
<tr>
<td style="padding:0.2cm; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;">Observations</td>
<td style="padding-left:0.5em; padding-right:0.5em; border-top:1px solid;">&nbsp;</td><td style="padding:0.2cm; padding-top:0.1cm; padding-bottom:0.1cm; text-align:center; border-top:1px solid;" colspan="3">832</td>
<td style="padding-left:0.5em; padding-right:0.5em; border-top:1px solid;">&nbsp;</td><td style="padding:0.2cm; padding-top:0.1cm; padding-bottom:0.1cm; text-align:center; border-top:1px solid;" colspan="3">832</td>
<td style="padding-left:0.5em; padding-right:0.5em; border-top:1px solid;">&nbsp;</td><td style="padding:0.2cm; padding-top:0.1cm; padding-bottom:0.1cm; text-align:center; border-top:1px solid;" colspan="3">833</td>
</tr>
<tr>
<td style="padding:0.2cm; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">R<sup>2</sup> / adj. R<sup>2</sup></td>

<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td><td style="padding:0.2cm; text-align:center; padding-top:0.1cm; padding-bottom:0.1cm;" colspan="3">.026 / .021</td>

<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td><td style="padding:0.2cm; text-align:center; padding-top:0.1cm; padding-bottom:0.1cm;" colspan="3">.081 / .075</td>

<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td><td style="padding:0.2cm; text-align:center; padding-top:0.1cm; padding-bottom:0.1cm;" colspan="3">.154 / .147</td>
 </tr>
</table>

Raport modelu możemy rozbudować dodając:

+ show.est = TRUE, 
+ show.std = NULL, 
+ show.ci = TRUE,
+ show.se = FALSE, 
+ show.header = FALSE, 
+ show.col.header = TRUE,
+ show.r2 = TRUE, 
+ show.icc = FALSE, 
+ show.re.var = FALSE,
+ show.fstat = FALSE, 
+ show.aic = FALSE, 
+ show.aicc = FALSE,
+ show.dev = FALSE
  

```r
sjt.lm(fit1, fit2, fit3,
       show.ci = FALSE,
       show.se = TRUE,
       show.header = TRUE,
       show.aic = TRUE,
       show.aicc = TRUE,
       show.dev = TRUE,
       show.fstat  = TRUE)
```


```
## Fitted models have different coefficients. Grouping may not work properly. Set `group.pred = FALSE` if you encouter cluttered labelling.
```

<table style="border-collapse:collapse; border:none;border-bottom:double;">
<tr>
<td style="padding:0.2cm; border-top:double;" rowspan="2"><em>Predictors</em></td>
<td colspan="12" style="padding:0.2cm; border-top:double; text-align:center; border-bottom:1px solid;"><em>Dependent Variables</em></td>
</tr>

<td style=" padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; " colspan="3">Negative impact with 7 items</td>
<td style=" padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; " colspan="3">Negative impact with 7 items</td>
<td style=" padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; " colspan="3">Negative impact with 7 items</td>
</tr>
<tr>
<td style="padding:0.2cm; font-style:italic;">&nbsp;</td>
<td style="padding-left:0.5em; padding-right:0.5em; font-style:italic;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; font-style:italic; ">B</td>
<td style="padding:0.2cm; text-align:center; font-style:italic; ">std. Error</td>
<td style="padding:0.2cm; text-align:center; font-style:italic; ">p</td>
<td style="padding-left:0.5em; padding-right:0.5em; font-style:italic;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; font-style:italic; ">B</td>
<td style="padding:0.2cm; text-align:center; font-style:italic; ">std. Error</td>
<td style="padding:0.2cm; text-align:center; font-style:italic; ">p</td>
<td style="padding-left:0.5em; padding-right:0.5em; font-style:italic;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; font-style:italic; ">B</td>
<td style="padding:0.2cm; text-align:center; font-style:italic; ">std. Error</td>
<td style="padding:0.2cm; text-align:center; font-style:italic; ">p</td> 
</tr>
<tr>
<td style="padding:0.2cm; border-top:1px solid; text-align:left;">(Intercept)</td>
<td style="padding-left:0.5em; padding-right:0.5em; border-top:1px solid; ">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; border-top:1px solid; ">8.40</td>
<td style="padding:0.2cm; text-align:center; border-top:1px solid; ">0.86</td>
<td style="padding:0.2cm; text-align:center; border-top:1px solid; "><b>&lt;.001</b></td>
<td style="padding-left:0.5em; padding-right:0.5em; border-top:1px solid; ">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; border-top:1px solid; ">9.18</td>
<td style="padding:0.2cm; text-align:center; border-top:1px solid; ">0.84</td>
<td style="padding:0.2cm; text-align:center; border-top:1px solid; "><b>&lt;.001</b></td>
<td style="padding-left:0.5em; padding-right:0.5em; border-top:1px solid; ">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; border-top:1px solid; ">8.48</td>
<td style="padding:0.2cm; text-align:center; border-top:1px solid; ">0.76</td>
<td style="padding:0.2cm; text-align:center; border-top:1px solid; "><b>&lt;.001</b></td>
</tr>
<tr>
<td style="padding:0.2cm; text-align:left;">carer' age</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.04</td>
<td style="padding:0.2cm; text-align:center; ">0.01</td>
<td style="padding:0.2cm; text-align:center; "><b>&lt;.001</b></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.01</td>
<td style="padding:0.2cm; text-align:center; ">0.01</td>
<td style="padding:0.2cm; text-align:center; ">.306</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.01</td>
<td style="padding:0.2cm; text-align:center; ">0.01</td>
<td style="padding:0.2cm; text-align:center; ">.384</td>
</tr>
<tr>

<td style="padding:0.2cm;" colspan="13">carer's level of education</td>
</tr>
<tr>
<td style="font-style:italic; padding:0.2cm; padding-left:0.6cm; text-align:left;">intermediate level of education</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.16</td>
<td style="padding:0.2cm; text-align:center; ">0.34</td>
<td style="padding:0.2cm; text-align:center; ">.652</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.12</td>
<td style="padding:0.2cm; text-align:center; ">0.34</td>
<td style="padding:0.2cm; text-align:center; ">.728</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.08</td>
<td style="padding:0.2cm; text-align:center; ">0.32</td>
<td style="padding:0.2cm; text-align:center; ">.806</td>
</tr>
<tr>
<td style="font-style:italic; padding:0.2cm; padding-left:0.6cm; text-align:left;">high level of education</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.79</td>
<td style="padding:0.2cm; text-align:center; ">0.43</td>
<td style="padding:0.2cm; text-align:center; ">.066</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.91</td>
<td style="padding:0.2cm; text-align:center; ">0.42</td>
<td style="padding:0.2cm; text-align:center; "><b>.030</b></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.52</td>
<td style="padding:0.2cm; text-align:center; ">0.41</td>
<td style="padding:0.2cm; text-align:center; ">.203</td>
</tr>
<tr>
<td style="padding:0.2cm; text-align:left;">carer's gender</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.70</td>
<td style="padding:0.2cm; text-align:center; ">0.31</td>
<td style="padding:0.2cm; text-align:center; "><b>.025</b></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.59</td>
<td style="padding:0.2cm; text-align:center; ">0.31</td>
<td style="padding:0.2cm; text-align:center; ">.053</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
</tr>
<tr>
<td style="padding:0.2cm; text-align:left;">average number of hours of care per week</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.02</td>
<td style="padding:0.2cm; text-align:center; ">0.00</td>
<td style="padding:0.2cm; text-align:center; "><b>&lt;.001</b></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
</tr>
<tr>

<td style="padding:0.2cm;" colspan="13">elder's dependency</td>
</tr>
<tr>
<td style="font-style:italic; padding:0.2cm; padding-left:0.6cm; text-align:left;">slightly dependent</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">1.18</td>
<td style="padding:0.2cm; text-align:center; ">0.52</td>
<td style="padding:0.2cm; text-align:center; "><b>.024</b></td>
</tr>
<tr>
<td style="font-style:italic; padding:0.2cm; padding-left:0.6cm; text-align:left;">moderately dependent</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">2.53</td>
<td style="padding:0.2cm; text-align:center; ">0.51</td>
<td style="padding:0.2cm; text-align:center; "><b>&lt;.001</b></td>
</tr>
<tr>
<td style="font-style:italic; padding:0.2cm; padding-left:0.6cm; text-align:left;">severely dependent</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">4.32</td>
<td style="padding:0.2cm; text-align:center; ">0.51</td>
<td style="padding:0.2cm; text-align:center; "><b>&lt;.001</b></td>
</tr>
<tr>
<td style="padding:0.2cm; text-align:left;">Services for elderly</td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding:0.2cm; text-align:center; "></td>
<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td>
<td style="padding:0.2cm; text-align:center; ">0.21</td>
<td style="padding:0.2cm; text-align:center; ">0.10</td>
<td style="padding:0.2cm; text-align:center; "><b>.042</b></td>
</tr>
<tr>
<td style="padding:0.2cm; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;">Observations</td>
<td style="padding-left:0.5em; padding-right:0.5em; border-top:1px solid;">&nbsp;</td><td style="padding:0.2cm; padding-top:0.1cm; padding-bottom:0.1cm; text-align:center; border-top:1px solid;" colspan="3">832</td>
<td style="padding-left:0.5em; padding-right:0.5em; border-top:1px solid;">&nbsp;</td><td style="padding:0.2cm; padding-top:0.1cm; padding-bottom:0.1cm; text-align:center; border-top:1px solid;" colspan="3">832</td>
<td style="padding-left:0.5em; padding-right:0.5em; border-top:1px solid;">&nbsp;</td><td style="padding:0.2cm; padding-top:0.1cm; padding-bottom:0.1cm; text-align:center; border-top:1px solid;" colspan="3">833</td>
</tr>
<tr>
<td style="padding:0.2cm; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">R<sup>2</sup> / adj. R<sup>2</sup></td>

<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td><td style="padding:0.2cm; text-align:center; padding-top:0.1cm; padding-bottom:0.1cm;" colspan="3">.026 / .021</td>

<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td><td style="padding:0.2cm; text-align:center; padding-top:0.1cm; padding-bottom:0.1cm;" colspan="3">.081 / .075</td>

<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td><td style="padding:0.2cm; text-align:center; padding-top:0.1cm; padding-bottom:0.1cm;" colspan="3">.154 / .147</td>
 </tr>
 <tr>
 <td style="padding:0.2cm; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">F&#45;statistics</td>

<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td> <td style="padding:0.2cm; text-align:center; padding-top:0.1cm; padding-bottom:0.1cm;" colspan="3">5.516***</td>

<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td> <td style="padding:0.2cm; text-align:center; padding-top:0.1cm; padding-bottom:0.1cm;" colspan="3">14.508***</td>

<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td> <td style="padding:0.2cm; text-align:center; padding-top:0.1cm; padding-bottom:0.1cm;" colspan="3">21.501***</td>
 </tr>
 <tr>
 <td style="padding:0.2cm; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">AIC</td>

<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td> <td style="padding:0.2cm; text-align:center; padding-top:0.1cm; padding-bottom:0.1cm;" colspan="3">4613.167</td>

<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td> <td style="padding:0.2cm; text-align:center; padding-top:0.1cm; padding-bottom:0.1cm;" colspan="3">4567.040</td>

<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td> <td style="padding:0.2cm; text-align:center; padding-top:0.1cm; padding-bottom:0.1cm;" colspan="3">4506.581</td>
</tr>
 <tr>
 <td style="padding:0.2cm; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">AICc</td>

<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td> <td style="padding:0.2cm; text-align:center; padding-top:0.1cm; padding-bottom:0.1cm;" colspan="3">4613.269</td>

<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td> <td style="padding:0.2cm; text-align:center; padding-top:0.1cm; padding-bottom:0.1cm;" colspan="3">4567.176</td>

<td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td> <td style="padding:0.2cm; text-align:center; padding-top:0.1cm; padding-bottom:0.1cm;" colspan="3">4506.800</td>
</tr>
<tr>
<td style="padding:0.2cm; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Deviance</td><td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td><td style="padding:0.2cm; text-align:center; padding-top:0.1cm; padding-bottom:0.1cm;" colspan="3">12285.861</td><td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td><td style="padding:0.2cm; text-align:center; padding-top:0.1cm; padding-bottom:0.1cm;" colspan="3">11595.352</td><td style="padding-left:0.5em; padding-right:0.5em;">&nbsp;</td><td style="padding:0.2cm; text-align:center; padding-top:0.1cm; padding-bottom:0.1cm;" colspan="3">10674.457</td>
</tr>
</table>

## Pakiet DT

W pakiecie DT możemy tworzyć interaktywne tabele do pokazywania danych. Poniżej przykład, jak taką tabelę można włączyć do raportu.


```r
data(apartments,package = 'PBImisc')
datatable(apartments[,1:5])
```

<!--html_preserve--><div id="htmlwidget-c81aa8dea113b06fded8" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-c81aa8dea113b06fded8">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150","151","152","153","154","155","156","157","158","159","160","161","162","163","164","165","166","167","168","169","170","171","172","173","174","175","176","177","178","179","180","181","182","183","184","185","186","187","188","189","190","191","192","193","194","195","196","197","198","199","200","201","202","203","204","205","206","207","208","209","210","211","212","213","214","215","216","217","218","219","220","221","222","223","224","225","226","227","228","229","230","231","232","233","234","235","236","237","238","239","240","241","242","243","244","245","246","247","248","249","250","251","252","253","254","255","256","257","258","259","260","261","262","263","264","265","266","267","268","269","270","271","272","273","274","275","276","277","278","279","280","281","282","283","284","285","286","287","288","289","290","291","292","293","294","295","296","297","298","299","300","301","302","303","304","305","306","307","308","309","310","311","312","313","314","315","316","317","318","319","320","321","322","323","324","325","326","327","328","329","330","331","332","333","334","335","336","337","338","339","340","341","342","343","344","345","346","347","348","349","350","351","352","353","354","355","356","357","358","359","360","361","362","363","364","365","366","367","368","369","370","371","372","373","374","375","376","377","378","379","380","381","382","383","384","385","386","387","388","389","390","391","392","393","394","395","396","397","398","399","400","401","402","403","404","405","406","407","408","409","410","411","412","413","414","415","416","417","418","419","420","421","422","423","424","425","426","427","428","429","430","431","432","433","434","435","436","437","438","439","440","441","442","443","444","445","446","447","448","449","450","451","452","453","454","455","456","457","458","459","460","461","462","463","464","465","466","467","468","469","470","471","472","473","474","475","476","477","478","479","480","481","482","483","484","485","486","487","488","489","490","491","492","493","494","495","496","497","498","499","500","501","502","503","504","505","506","507","508","509","510","511","512","513","514","515","516","517","518","519","520","521","522","523","524","525","526","527","528","529","530","531","532","533","534","535","536","537","538","539","540","541","542","543","544","545","546","547","548","549","550","551","552","553","554","555","556","557","558","559","560","561","562","563","564","565","566","567","568","569","570","571","572","573","574","575","576","577","578","579","580","581","582","583","584","585","586","587","588","589","590","591","592","593","594","595","596","597","598","599","600","601","602","603","604","605","606","607","608","609","610","611","612","613","614","615","616","617","618","619","620","621","622","623","624","625","626","627","628","629","630","631","632","633","634","635","636","637","638","639","640","641","642","643","644","645","646","647","648","649","650","651","652","653","654","655","656","657","658","659","660","661","662","663","664","665","666","667","668","669","670","671","672","673","674","675","676","677","678","679","680","681","682","683","684","685","686","687","688","689","690","691","692","693","694","695","696","697","698","699","700","701","702","703","704","705","706","707","708","709","710","711","712","713","714","715","716","717","718","719","720","721","722","723","724","725","726","727","728","729","730","731","732","733","734","735","736","737","738","739","740","741","742","743","744","745","746","747","748","749","750","751","752","753","754","755","756","757","758","759","760","761","762","763","764","765","766","767","768","769","770","771","772","773","774","775","776","777","778","779","780","781","782","783","784","785","786","787","788","789","790","791","792","793","794","795","796","797","798","799","800","801","802","803","804","805","806","807","808","809","810","811","812","813","814","815","816","817","818","819","820","821","822","823","824","825","826","827","828","829","830","831","832","833","834","835","836","837","838","839","840","841","842","843","844","845","846","847","848","849","850","851","852","853","854","855","856","857","858","859","860","861","862","863","864","865","866","867","868","869","870","871","872","873","874","875","876","877","878","879","880","881","882","883","884","885","886","887","888","889","890","891","892","893","894","895","896","897","898","899","900","901","902","903","904","905","906","907","908","909","910","911","912","913","914","915","916","917","918","919","920","921","922","923","924","925","926","927","928","929","930","931","932","933","934","935","936","937","938","939","940","941","942","943","944","945","946","947","948","949","950","951","952","953","954","955","956","957","958","959","960","961","962","963","964","965","966","967","968","969","970","971","972","973"],[2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2009,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2007,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2007,2008,2009,2008,2008,2008,2008,2008,2008,2008,2009,2008,2008,2007,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2007,2008,2009,2008,2008,2008,2008,2008,2008,2009,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2009,2007,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2007,2008,2008,2008,2008,2008,2009,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2009,2008,2008,2008,2008,2008,2009,2009,2008,2008,2008,2008,2008,2007,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2007,2008,2008,2008,2008,2008,2007,2008,2008,2008,2008,2008,2008,2008,2008,2009,2008,2008,2008,2009,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2007,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2007,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2007,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2008,2009,2009,2009,2009,2008,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2008,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2008,2008,2009,2009,2008,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2008,2009,2009,2009,2008,2009,2009,2008,2008,2007,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2008,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2007,2009,2009,2009,2009,2009,2009,2009,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2008,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2008,2007,2007,2007,2007,2007,2008,2007,2007,2007,2007,2007,2009,2007,2007,2007,2007,2007,2007,2008,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2008,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2008,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2009,2007,2007,2007,2008,2007,2007,2007,2007,2009,2009,2009,2008,2009,2009,2009,2009,2009,2009,2007,2009,2008,2009,2009,2009,2009,2009,2009,2009,2009,2009,2008,2009,2009,2009,2008,2009,2008,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2009,2008,2008,2008,2008,2009,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2009,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2008,2009,2008,2008,2008,2009,2008,2008,2008,2009,2008,2008,2008,2008,2008,2008,2008,2008,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2008,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2009,2007,2007,2007,2007,2007,2007,2007,2008,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2008,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2009,2007,2007,2007,2008,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007,2007],[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,1,1,1,1,1,2,2,2,2,2,2,2,2,10,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,9,12,2,8,2,2,2,2,2,2,2,3,2,2,6,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,9,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,9,4,4,4,4,10,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,7,7,1,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,7,6,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,11,9,5,5,5,5,8,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,4,7,7,7,7,7,8,3,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,7,9,9,9,9,9,10,9,6,9,9,9,9,9,9,7,9,9,9,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,6,10,10,10,10,2,10,10,10,10,10,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,1,1,1,1,1,1,1,1,1,1,10,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,10,3,3,3,3,3,3,3,3,3,3,3,9,3,3,3,3,9,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,2,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,2,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,4,5,5,5,5,5,5,7,10,7,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,9,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,5,10,7,7,7,7,7,7,7,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,2,6,6,6,6,6,6,6,6,6,6,6,6,2,6,6,6,6,6,9,6,6,6,6,6,5,6,6,6,6,6,6,4,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,5,7,7,7,7,7,7,7,7,7,7,9,7,7,7,7,7,7,7,7,7,7,7,7,7,5,7,7,7,2,7,7,7,7,8,8,8,4,8,8,8,8,8,8,6,8,1,8,8,8,8,8,8,8,8,8,3,8,8,8,4,8,5,8,8,8,8,8,8,8,8,8,8,5,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,8,9,9,9,9,9,9,9,9,9,9,9,9,9,8,9,9,9,9,9,9,5,9,9,9,9,9,9,9,6,9,9,9,5,9,9,9,5,9,9,9,9,9,9,9,9,10,10,10,10,11,10,10,10,10,10,10,10,10,7,10,10,10,10,10,10,10,10,10,10,10,10,10,5,10,10,10,10,10,10,10,9,10,10,10,10,7,10,10,10,10,10,10,10,10,11,11,11,12,11,11,11,11,1,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,12,8,12,12,12,4,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12],[20,25,26,27,28,28,30,32,32,34,35,36,36,36,37,37,37,37,38,40,40,55,41,42,44,44,47,48,50,53,54,56,56,57,73,75,46,82,83,85,91,130,20,23,26,27,27,28,29,29,72,35,35,35,36,37,37,37,38,38,38,42,46,48,50,57,54,55,56,56,56,57,57,57,35.4,21,63,44,73,73,74,81,82,82,83,45,111,125,102,24,26,28,29,30,31,31,31,31,31,33,33,33,35,35,36,36,37,39,39,61,42,43,43,44,45,47,49,50,53,54,55,56,56,56,57,59,60,60,61,61,62,62,67,67,70,73,74,107,113,186,17,19,20,23,23,24,26,26.5,27,30,30,30,31.6,32,32.5,33,40,37,38,38,38,85,46,47,49,50,52,52,53,58,60,61,63,68,72,81,82,97,26,46,89,107,130,20,28,31,27,35,35,35,36,37,37,38,38,38,39,49,127,42,43,44,45,45,46,46,46,47,47,48,48,50,53,53,53,53,54,55,56,56,57,57,58,60,62,64,73,75,27,33.8,105,105,122,137,25,17.35,24,26,27,28,30.9,31,31,32,33.08,34,34,34,34,36,37,38,40,42,42,42.5,43,43.57,34,46.2,47.15,49,49,50,53.3,55,55,56,57,57,57,58,64,64,66,68,70,73.4,91,101,110,110,116.1,117,135,135,144,190,41,27,27,28,29,30,48,64,34,35,36,37,38,50,38,40,41,41,42,42,45,47,48,51,51,55,55,56,56,57,59,60,64,74,78,78,84,152,38,39,39,43,44,46,50,53,53,57,59,59,63,70,73,87,93,77,28,28.65,31.5,31.5,32.14,44,33.2,45,37.93,37.93,38,38.97,39,40,48,41.8,42.3,42.4,33,45.5,46.3,47,47,48.3,48.41,49,49,50.53,52,53.65,54,56,56,61,66,70.5,73,74.66,75,75,86,90,118,27,29,30,30,31,35,36,40,46,46,46,57,52,53,55,75,54,103,111,111,116,135,15,23,24,24,24,33,34,34,35,36,37,37,37,37,38,46,47,48,48,48,49,53,54,56,57,59,68,71,78,80,97,100,100,140,220,31,32,33.8,36.4,37,38,38,38,39,43,56,47,48,49,49.9,50,52,60,70,72.7,76,77,87,92,96,108.3,140,29.62,32,36,37,37.5,37.91,41,45,45,46,46,48,49,53,64,71,71.69,74.2,117.9,135,36,36,37,39,39,41,45,65,45,46,46,49,50,50,50,51,53,53,53,56,55,57,57,60,51,69,69,70,74,78,79,94,122,169,31,31,32,32,33,35,36,38,39,160,42,43,43,45,45,46,48,50,50,52,52,52,62,63,68,77,78,81,83,93,98,100,19,20,24,193,67,28,29,41,31,31,32,37,38,38,39,40,46,48,48,52,54,54,37,58,59,63,40,66,70,33,47,20,74,78,80,81,83,97,122,141,24,27,27,27,30,35,37,38,41,42,43,44,44,46,23,47,48,51,51,53,61,63,64,29,31,33,34,35,36,46,46,47,54,34,49,50,52,55,56,58,60,19,22,27,27,31,31,31,32,33,33,33,33,35,36,37,38,38,38,39,41,41,42,43,44,44,45,33,46,46,46,48,48,49,49,49,52,52,54,57,85,60,64,66,69,71,45.1,72,73,81,86,89,70,110,117,45,130,147,160,83,20,23,24,25,25,28,29,30,31,31,31,31,32,34,35,35,36,36,83,37,37,38,38,41,42,44,47,48,48,70,50,55,56,58,58,59,60,62,63,65,65,67,77,70,80,82,88,63,98,100,101,115,18,19,24,85,28,28,28,29,30,32,71,35,41,36,36,38,38,38,38,39,39,44,41,45,46,47,83,48,93,48,48,48,48,50,51,51,51,51,53,70,58,62,64,64,71,72,74,80,80,88,48,20,22,22,22,53,23,24,26,26,27,27,30,35,37,37,40,43,46,35,47,47,48,48,49,50,34,52,53,53,55,55,55,56,47,57,58,60,29,63,64,64,65,72,76,81,81,83,88,105,163,17,31,33,33,33,35,35,38,38,40,40,41,41,38,46,46,47,47,48,49,50,52,53,55,55,55,56,24,56,57,60,60,61,63,63,27,66,68,70,71,37,72,73,82,94,98,100,124,145,24,24,26,24,30,30,31,31,76,35,36,37,37,37,37,39,40,45,47,49,54,59,63,71,72,94,102,175,20,112,23,23,23,39,26,27,27,28,28,30,31,31,32,34,35,36,36,37,37,38,41,47,47,48,48,49,49,50,51,52,52,57,58,58,59,62,62,68,70,77,82,88,106,132],["Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa","Warszawa"],["Srodmiescie","Pruszkow","Bielany","Wola","Mokotow","Mokotow","Srodmiescie","Mokotow","Srodmiescie","Jozefoslaw","Bemowo","Wola","Wola","Praga Poludnie","Bialoleka","Mokotow","Zoliborz","Zoliborz","Praga Poludnie","Mokotow","Bielany","Mokotow","Mokotow","Mokotow","Srodmiescie","Srodmiescie","Ursynow","Wola","Wola","Mokotow","Bielany","Zoliborz","Zoliborz","Mokotow","Wawer","Praga Poludnie","Mokotow","Mokotow","Mokotow","Wilanow","Mokotow","Srodmiescie","Srodmiescie","Srodmiescie","Bielany","Srodmiescie","Wola","Ochota","Ochota","Praga Poludnie","Mokotow","Bemowo","Bialoleka","Bemowo","Praga Poludnie","Mokotow","Bialoleka","Zoliborz","Praga Poludnie","Praga Poludnie","Ochota","Mokotow","Mokotow","Mokotow","Bemowo","Mokotow","Bielany","Mokotow","Mokotow","Srodmiescie","Mokotow","Mokotow","Ursynow","Bielany","Mokotow","Mokotow","Mokotow","Mokotow","Mokotow","Mokotow","Mokotow","Jozefoslaw","Mokotow","Ochota","Mokotow","Bielany","Wola","Wilanow","Zoliborz","Wola","Srodmiescie","Mokotow","Ochota","Srodmiescie","Mokotow","Mokotow","Mokotow","Wilanow","Mokotow","Praga Poludnie","Mokotow","Mokotow","Wola","Bemowo","Ursus","Ochota","Srodmiescie","Srodmiescie","Targowek","Bielany","Zoliborz","Zoliborz","Mokotow","Ursus","Bialoleka","Praga Poludnie","Praga Polnoc","Srodmiescie","Mokotow","Bialoleka","Bialoleka","Mokotow","Mokotow","Srodmiescie","Mokotow","Praga Poludnie","Brwinow","Brwinow","Praga Poludnie","Bemowo","Wola","Ursynow","Bielany","Praga Poludnie","Bielany","Mokotow","Zoliborz","Ursynow","Srodmiescie","Mokotow","Srodmiescie","Mokotow","Srodmiescie","Ochota","Wola","Zoliborz","Praga Poludnie","Wlochy","Bialoleka","Srodmiescie","Zoliborz","Bielany","Mokotow","Zoliborz","Mokotow","Ochota","Srodmiescie","Mokotow","Wola","Praga Poludnie","Mokotow","Wesola","Targowek","Bielany","Praga Poludnie","Srodmiescie","Ursynow","Praga Poludnie","Ursynow","Bialoleka","Mokotow","Wilanow","Mokotow","Wawer","Ochota","Srodmiescie","Mokotow","Srodmiescie","Srodmiescie","Wola","Mokotow","Mokotow","Ochota","Praga Polnoc","Praga Poludnie","Praga Poludnie","Srodmiescie","Srodmiescie","Mokotow","Ursus","Srodmiescie","Wola","Mokotow","Mokotow","Bielany","Mokotow","Srodmiescie","Srodmiescie","Srodmiescie","Ursynow","Bialoleka","Bialoleka","Wola","Zoliborz","Ochota","Bielany","Mokotow","Bialoleka","Rembertow","Praga Poludnie","Wola","Mokotow","Mokotow","Wola","Mokotow","Mokotow","Bielany","Mokotow","Ursynow","Ochota","Ursynow","Mokotow","Mokotow","Praga Poludnie","Targowek","Praga Polnoc","Mokotow","Bemowo","Srodmiescie","Mokotow","Bemowo","Bialoleka","Ochota","Mokotow","Mokotow","Wola","Wola","Mokotow","Zoliborz","Wlochy","Bialoleka","Targowek","Ursynow","Tarchomin","Bielany","Ursynow","Ochota","Mokotow","Mokotow","Srodmiescie","Mokotow","Praga Poludnie","Ursynow","Mokotow","Srodmiescie","Mokotow","Srodmiescie","Bialoleka","Mokotow","Bialoleka","Praga Poludnie","Wola","Bielany","Mokotow","Srodmiescie","Wilanow","Bielany","Mokotow","Zoliborz","Zoliborz","Mokotow","Mokotow","Praga Polnoc","Wola","Mokotow","Srodmiescie","Grochow","Bielany","Mokotow","Ursynow","Mokotow","Wola","Zoliborz","Ursynow","Wilanow","Mokotow","Ochota","Mokotow","Bielany","Bialoleka","Wola","Mokotow","Praga Poludnie","Wola","Bielany","Bielany","Ochota","Bialoleka","Srodmiescie","Mokotow","Wola","Bemowo","Bielany","Srodmiescie","Ursynow","Ursynow","Mokotow","Srodmiescie","Mokotow","Ursynow","Karczew","Mokotow","Mokotow","Wola","Srodmiescie","Mokotow","Mokotow","Zoliborz","Praga Poludnie","Praga Poludnie","Mokotow","Ursynow","Ursynow","Ursynow","Srodmiescie","Praga Poludnie","Srodmiescie","Wola","Praga Poludnie","Mokotow","Praga Poludnie","Srodmiescie","Mokotow","Mokotow","Mokotow","Mokotow","Bemowo","Praga Polnoc","Mokotow","Mokotow","Mokotow","Mokotow","Mokotow","Bemowo","Targowek","Wlochy","Bialoleka","Mokotow","Bielany","Bemowo","Mokotow","Praga Poludnie","Mokotow","Mokotow","Bialoleka","Srodmiescie","Mokotow","Srodmiescie","Praga Poludnie","Bialoleka","Mokotow","Ursynow","Praga Poludnie","Srodmiescie","Mokotow","Mokotow","Ursynow","Bielany","Praga Poludnie","Bielany","Ursynow","Wawer","Wlochy","Ochota","Mokotow","Zoliborz","Mokotow","Wola","Srodmiescie","Ursus","Ursynow","Bielany","Mokotow","Mokotow","Srodmiescie","Praga Poludnie","Mokotow","Wola","Srodmiescie","Zoliborz","Bielany","Mokotow","Bialoleka","Bialoleka","Srodmiescie","Zoliborz","Brwinow","Praga Polnoc","Praga Poludnie","Mokotow","Wilanow","Bielany","Wawer","Praga Poludnie","Srodmiescie","Mokotow","Ochota","Mokotow","Praga Poludnie","Ochota","Wola","Praga Poludnie","Wola","Ochota","Pruszkow","Wola","Bialoleka","Wola","Srodmiescie","Praga Polnoc","Rembertow","Mokotow","Zoliborz","Zoliborz","Rembertow","Bialoleka","Mokotow","Bemowo","Bialoleka","Wola","Bialoleka","Bielany","Bemowo","Srodmiescie","Bialoleka","Mokotow","Bialoleka","Ursynow","Praga Poludnie","Mokotow","Bialoleka","Srodmiescie","Mokotow","Zoliborz","Bielany","Srodmiescie","Bialoleka","Ursynow","Praga Poludnie","Zoliborz","Zoliborz","Ochota","Srodmiescie","Srodmiescie","Mokotow","Praga Polnoc","Ursynow","Ochota","Bemowo","Mokotow","Bialoleka","Bemowo","Wola","Ursynow","Ursus","Zoliborz","Srodmiescie","Ursynow","Bemowo","Ursynow","Ursynow","Praga Poludnie","Zoliborz","Wola","Praga Poludnie","Wola","Targowek","Zoliborz","Wola","Srodmiescie","Praga Polnoc","Praga Poludnie","Bialoleka","Zabki","Pruszkow","Mokotow","Wola","Wilanow","Ursynow","Ursynow","Ursynow","Mokotow","Ochota","Praga Poludnie","Praga Poludnie","Praga Poludnie","Bielany","Praga Poludnie","Mokotow","Bielany","Praga Poludnie","Mokotow","Srodmiescie","Bielany","Srodmiescie","Srodmiescie","Rembertow","Mokotow","Srodmiescie","Grodzisk Mazowiecki","Mokotow","Ursynow","Mokotow","Wola","Bemowo","Mokotow","Ursynow","Bialoleka","Mokotow","Ursynow","Targowek","Srodmiescie","Mokotow","Srodmiescie","Srodmiescie","Ursynow","Mokotow","Srodmiescie","Bialoleka","Srodmiescie","Srodmiescie","Ochota","Wola","Praga Poludnie","Mokotow","Bielany","Praga Poludnie","Bielany","Bialoleka","Ursynow","Bielany","Bialoleka","Srodmiescie","Srodmiescie","Ursynow","Ursynow","Zoliborz","Ursynow","Srodmiescie","Ursynow","Bemowo","Mokotow","Praga Poludnie","Srodmiescie","Wola","Ursynow","Bialoleka","Wola","Ochota","Srodmiescie","Srodmiescie","Mokotow","Mokotow","Targowek","Wola","Mokotow","Mokotow","Srodmiescie","Srodmiescie","Bielany","Zoliborz","Bemowo","Mokotow","Targowek","Ursynow","Bielany","Ursynow","Bielany","Mokotow","Srodmiescie","Ursynow","Praga Poludnie","Wilanow","Srodmiescie","Mokotow","Bielany","Wola","Srodmiescie","Wola","Srodmiescie","Srodmiescie","Ursynow","Bemowo","Wlochy","Wilanow","Ursynow","Srodmiescie","Bielany","Bielany","Wola","Srodmiescie","Zoliborz","Praga Poludnie","Praga Polnoc","Wilanow","Bielany","Ursynow","Ursynow","Bialoleka","Praga Poludnie","Mokotow","Srodmiescie","Praga Poludnie","Praga Poludnie","Bemowo","Rembertow","Ursynow","Targowek","Srodmiescie","Mokotow","Srodmiescie","Bemowo","Zoliborz","Srodmiescie","Srodmiescie","Wola","Mokotow","Bemowo","Praga Poludnie","Bemowo","Zabki","Bielany","Bemowo","Wilanow","Srodmiescie","Mokotow","Ursynow","Bemowo","Ochota","Mokotow","Srodmiescie","Mokotow","Srodmiescie","Mokotow","Wola","Targowek","Srodmiescie","Srodmiescie","Bialoleka","Ursynow","Targowek","Bemowo","Ochota","Srodmiescie","Praga Poludnie","Wola","Wola","Ursus","Wlochy","Zoliborz","Ochota","Srodmiescie","Zoliborz","Bielany","Bemowo","Praga Poludnie","Mokotow","Mokotow","Praga Poludnie","Bemowo","Ochota","Bialoleka","Zoliborz","Srodmiescie","Mokotow","Bemowo","Srodmiescie","Bemowo","Wola","Bialoleka","Praga Poludnie","Bemowo","Srodmiescie","Bemowo","Praga Poludnie","Ochota","Srodmiescie","Bemowo","Ursus","Bemowo","Praga Poludnie","Srodmiescie","Bemowo","Mokotow","Srodmiescie","Mokotow","Zoliborz","Srodmiescie","Srodmiescie","Ochota","Praga Polnoc","Mokotow","Zoliborz","Zoliborz","Praga Polnoc","Kabaty","Bemowo","Zoliborz","Wola","Mokotow","Zoliborz","Srodmiescie","Bielany","Ochota","Praga Poludnie","Zoliborz","Ursynow","Praga Polnoc","Ursynow","Zoliborz","Wesola","Bielany","Ursynow","Mokotow","Srodmiescie","Ochota","Ursynow","Wilanow","Ursynow","Bialoleka","Ursynow","Wola","Praga Poludnie","Ursynow","Mokotow","Bialoleka","Mokotow","Srodmiescie","Ursynow","Wawer","Ursynow","Mokotow","Ursynow","Mokotow","Ursynow","Mokotow","Srodmiescie","Ochota","Ochota","Ochota","Srodmiescie","Mokotow","Ursynow","Mokotow","Mokotow","Wola","Bemowo","Wola","Targowek","Ochota","Wawer","Praga Polnoc","Bemowo","Bemowo","Bielany","Srodmiescie","Wlochy","Srodmiescie","Ursynow","Wola","Ursynow","Praga Polnoc","Bemowo","Praga Poludnie","Mokotow","Praga Polnoc","Ursus","Ursus","Ursus","Bielany","Mokotow","Bialoleka","Praga Polnoc","Bielany","Srodmiescie","Bemowo","Praga Poludnie","Mokotow","Ursus","Ursynow","Mokotow","Bialoleka","Mokotow","Mokotow","Mokotow","Ursynow","Bemowo","Bialoleka","Srodmiescie","Ursus","Zoliborz","Srodmiescie","Ochota","Wola","Ursus","Zoliborz","Targowek","Srodmiescie","Wola","Srodmiescie","Wola","Srodmiescie","Srodmiescie","Srodmiescie","Ursynow","Wola","Praga Poludnie","Praga Poludnie","Praga Poludnie","Mokotow","Srodmiescie","Zoliborz","Ochota","Ursynow","Wola","Praga Poludnie","Ursynow","Praga Poludnie","Mokotow","Targowek","Mokotow","Praga Poludnie","Bielany","Praga Poludnie","Ursus","Praga Poludnie","Mokotow","Praga Poludnie","Ochota","Ursynow","Praga Poludnie","Mokotow","Ursynow","Ursynow","Srodmiescie","Praga Poludnie","Mokotow","Mokotow","Bialoleka","Ursynow","Ursus","Srodmiescie","Bemowo","Praga Poludnie","Mokotow","Mokotow","Mokotow","Mokotow","Bielany","Srodmiescie","Bemowo","Jozefoslaw","Srodmiescie","Wola","Bialoleka","Targowek","Ochota","Bemowo","Wawer","Ochota","Ursynow","Mokotow","Ochota","Srodmiescie","Ochota","Wola","Zoliborz","Bielany","Bielany","Mokotow","Bialoleka","Brodno","Mokotow","Bemowo","Ursynow","Bielany","Ochota","Ursynow","Bielany","Bialoleka","Bielany","Praga Poludnie","Ochota","Bialoleka","Ochota","Mokotow","Ochota","Mokotow","Mokotow","Ochota","Praga Polnoc","Wola","Bielany","Mokotow","Mokotow","Mokotow","Praga Poludnie","Bielany","Mokotow","Bialoleka","Bielany","Wlochy","Mokotow","Wola","Bielany","Mokotow","Ursynow","Ursynow","Mokotow","Bialoleka","Mokotow","Ursynow","Zabki","Srodmiescie","Zoliborz","Bialoleka","Mokotow","Wola","Bielany","Mokotow","Praga Poludnie","Praga Poludnie","Bielany","Bielany","Bielany","Mokotow","Srodmiescie","Wola","Bielany","Bemowo","Bielany","Bialoleka","Mokotow","Srodmiescie","Bialoleka","Srodmiescie","Targowek","Wola","Ochota","Wilanow","Mokotow","Zoliborz","Mokotow","Ursus","Bielany","Praga Poludnie","Bemowo","Srodmiescie","Mokotow","Ochota","Mokotow","Bielany","Praga Poludnie","Ursynow","Mokotow","Praga Poludnie","Wlochy","Praga Poludnie","Ochota","Mokotow","Mokotow","Srodmiescie","Wilanow"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> \u003c/th>\n      <th>year\u003c/th>\n      <th>month\u003c/th>\n      <th>surface\u003c/th>\n      <th>city\u003c/th>\n      <th>district\u003c/th>\n    \u003c/tr>\n  \u003c/thead>\n\u003c/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->



