#' @title Calculate the amount of fiber in food
#' @description Sometimes, nutritional labels fail to inform the amount
#' of fiber it contains. This function helps one estimate this given
#' other parameters.
#' @param kcal total energy per unit of measurement (e.g. 100 g)
#' @param fat grams of fat per unit of measurement (e.g. 100 g)
#' @param carbs grams of carbohydrate per unit of measurement (e.g. 100 g)
#' @param protein grams of protein per unit of measurement (e.g. 100 g)
#' @return Grams of fiber per unit of measurement
#' @author Waldir Leoncio
#' @export
#' @examples
#' fiberGrams(362, 17, 11, 40)
fiberGrams <- function(kcal, fat, carbs, protein) {
  macroKcal <- totalKcal(fat, carbs, protein)
  kcalFiber <- kcal - macroKcal
  return(kcalFiber / kcal_1g_fiber)
}
