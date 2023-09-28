#' Table of hour of day and percentage of day
#' @name pct_of_day
#' @docType data
#' @export
pct_of_day <- data.frame("hour" = 0:24, "pct_of_day" = floor(0:24 / 24 * 100))
