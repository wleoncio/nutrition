#' @title Macro distribution
#' @description Calculates the percentage of energy from each macronutrient.
#' @inheritParams totalKcal
#' @return vector with the energy ratio from each macronutrient
#' @author Waldir Leoncio
#' @export
#' @examples
#' macroDistro(12, 40, 32, 1)
#' macroDistro(12, 40, 32)
macroDistro <- function(fat, carbs, protein, fiber = 0) {
  totcal <- totalKcal(fat, carbs, protein, fiber)
  out <- c(
    fat = fat * kcal_1g_fat / totcal,
    carbs = carbs * kcal_1g_carbs / totcal,
    protein = protein * kcal_1g_protein / totcal
  )
  if (fiber != 0) {
    out["fiber"] <- fiber * kcal_1g_fiber / totcal
  }
  return(out)
}
