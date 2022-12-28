#' @title Basal Metabolic Rate
#' @description Estimates the basal metabolic rate of a person.
#' @param weight weight, in kilograms
#' @param age age, in years
#' @param fat fat proportion in body
#' @param height height, in centimeters
#' @param activity activity level (a scalar between 1 and 2)
#' @param method calculation method ("msj" for Mifflin-St. Jeor or "kma" for
#'  Katch-McArdle)
#' @return The Basal Metabolic Rate, in kilocalories
#' @author Waldir Leoncio
#' @references https://www.calculator.net/bmr-calculator.html
#' @export
#' @examples bmr(67, 40, .12, 178) # for an individual with 12% body fat
bmr <- function(weight, age, fat, height, activity = 1.45, method = "msj") {
  bmr <- switch(
    method,
    "msj" = 9.99 * weight + 6.25 * height - 4.92 * age + 5,
    "kma" = 370 + 21.6 * (1 - fat) * weight,
    stop("method must be either msj or kma")
  )
  return(bmr * activity)
}
