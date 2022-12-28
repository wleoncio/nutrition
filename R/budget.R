#' @title Calorie budget
#' @description Calculates a calorie budget
#' @param wt_delta_per_week expected change in weight per week
#' @param bmr Basal Metabolic Rate, in kilocalories
#' @return Calorie targets per day
#' @author Waldir Leoncio
#' @references
#' https://help.loseit.com/hc/en-us/articles/115007245847-How-the-Calorie-Budget-is-Calculated
#' @export
#' @examples
#' BMR <- bmr(66, 40, .12, 178, method = "kma")
#' budget(0, BMR) # for weight maintenance with a weekend bonus
#' budget(.25, BMR) # for a slight weight gain
budget <- function(wt_delta_per_week, bmr) {
  lbs_to_kg <- .4535924
  kcal_1_lbs_fat <- 3500
	budget_delta_per_week <- wt_delta_per_week / lbs_to_kg * kcal_1_lbs_fat
	budget_delta_per_day <- budget_delta_per_week / 7
	daily_budget <- c("kcal per day" = bmr + budget_delta_per_day)
  daily_budget_weekend <- c(
    "weekdays" = daily_budget * 0.96, "weekend" = daily_budget * 1.10
  )
  return(
    list(
      "constant" = daily_budget,
      "flexible" = daily_budget_weekend
    )
  )
}
