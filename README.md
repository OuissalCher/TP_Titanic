# TP_Titanic

Analyse reproductible du dataset Titanic avec RMarkdown, Git et création d'un package R.

Ouissal CHEROUAT

## Contenu

- `Analyse.Rmd` : rapport d'analyse
- `Analyse.html` : rapport final généré avec knit
- `TitanicPackage/` : package R avec la fonction `taux_survie()`

## Utilisation du package

```r
devtools::install("TitanicPackage")
library(TitanicPackage)
data(TitanicSurvival, package = "carData")
taux_survie(TitanicSurvival, "sex")
taux_survie(TitanicSurvival, "passengerClass")
```

Packages nécessaires pour le rapport : carData, dplyr, ggplot2, rmarkdown, devtools.