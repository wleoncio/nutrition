#' @title Percentage of carbs in food
#' @description Calculates how much of the energy content comes from
#' carbohydrates.
#' @inheritParams totalKcal
#' @inheritParams fiberGrams
#' @return percentage of energy from carbs
#' @author Waldir Leoncio
#' @export
#' @examples
#' carbPct(57, 11, 19, 8)
carbPct <- function(fat, carbs, protein, fiber = 0, kcal = 0) {
  # Determining caloric content
  assumedKcal <- totalKcal(fat, carbs, protein, fiber)
  if (kcal == 0) {
    kcal <- assumedKcal
    cat("Total energy:", kcal, "kcal\n")
  } else if (kcal < assumedKcal) {
    warning("kcal should be at least ", assumedKcal, ". Proceeding anyway")
  } else if (kcal > assumedKcal && fiber > 0) {
    message(kcal - assumedKcal, " kcal unaccounted for. Proceeding anyway.")
  } else if (fiber == 0) {
    gramFiber <- fiberGrams(kcal, fat, carbs, protein)
    cat("Presuming", gramFiber, "g of fiber\n")
  }

  # Determining carb percentage
  return(totalKcal(0, carbs, 0) / kcal)
}
