#' Calcul du taux de survie
#'
#' Calcule le taux de survie en fonction d'une variable donnée
#' (par exemple le sexe ou la classe des passagers).
#'
#' @author Ouissal CHEROUAT
#'
#' @param data Un data frame contenant une variable `survived` ("yes" / "no")
#' @param variable Le nom de la variable de groupement (sous forme de chaîne de caractères)
#' @return Un data frame avec, pour chaque groupe, l'effectif et le taux de survie
#' @importFrom dplyr %>% group_by summarize n .data
#' @export
#'
#' @examples
#' if (requireNamespace("carData", quietly = TRUE)) {
#'   data(TitanicSurvival, package = "carData")
#'   taux_survie(TitanicSurvival, "sex")
#'   taux_survie(TitanicSurvival, "passengerClass")
#' }
taux_survie <- function(data, variable) {
  if (!variable %in% names(data)) {
    stop("La variable '", variable, "' n'existe pas dans le jeu de données.")
  }
  data %>%
    group_by(.data[[variable]]) %>%
    summarize(
      Effectif = n(),
      TauxSurvie = sum(survived == "yes", na.rm = TRUE) / n(),
      .groups = "drop"
    )
}
