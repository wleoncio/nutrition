#' @title Calorie budget
#' @description Calculates a calorie budget
#' @param wt_delta_per_week expected change in weight per week
#' @param bmr Basal Metabolic Rate, in kilocalories
#' @param weekends if \code{TRUE}, weekends are given a higher budget in
#' detriment of weekdays
#' @return Calorie targets per day
#' @author Waldir Leoncio
#' @references
#' https://help.loseit.com/hc/en-us/articles/115007245847-How-the-Calorie-Budget-is-Calculated
#' @export
#' @examples
#' BMR <- bmr(66, 40, .12, 178, method = "kma")
#' budget(0, BMR, TRUE) # for weight maintenance with a weekend bonus
#' budget(.25, BMR) # for a slight weight gain
budget <- function(wt_delta_per_week, bmr, weekends = FALSE) {
	budget_delta_per_week <- wt_delta_per_week / .4535924 * 3500
	budget_delta_per_day <- budget_delta_per_week / 7
	daily_budget <- bmr + budget_delta_per_day
	if (weekends) {
		return(c("weekdays" = daily_budget * 0.96, "weekend" = daily_budget * 1.10))
  } else {
		return(daily_budget)
  }
}
