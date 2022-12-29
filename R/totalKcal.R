#' @title Total calories
#' @description Calculate the total caloric content of an item given the weight
#' of its macronutrients
#' @param fat grams of fat per unit of measurement (e.g. 100 g)
#' @param carbs grams of carbohydrates per unit of measurement (e.g. 100 g)
#' @param protein grams of protein per unit of measurement (e.g. 100 g)
#' @param fiber grams of fiber per unit of measurement (e.g. 100 g)
#' @return Total energy content per unit of measurement
#' @author Waldir Leoncio
#' @export
#' @examples
#' totalKcal(48, 1.7, 29)
totalKcal <- function(fat, carbs, protein, fiber = 0) {
  return(
    kcal_1g_fat * fat +
    kcal_1g_carbs * carbs +
    kcal_1g_protein * protein +
    kcal_1g_fiber * fiber
  )
}
