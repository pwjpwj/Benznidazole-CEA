generate_rr_lognormal <- function(RR_min = NULL, RR_max = NULL, mean_rr = NULL, n = 10000, conf_level = 0.95, seed = NULL) {
  if (!is.null(seed)) set.seed(seed)  # Set seed for reproducibility
  
  # Check that input is correct
  if (is.null(mean_rr) && (is.null(RR_min) || is.null(RR_max))) {
    stop("You must provide either 'mean_rr' or both 'RR_min' and 'RR_max'.")
  }
  
  if (!is.null(mean_rr)) {
    # If mean_rr is provided, you still need a measure of spread
    if (is.null(RR_min) || is.null(RR_max)) {
      stop("If 'mean_rr' is provided, you must also provide 'RR_min' and 'RR_max' to estimate the spread.")
    }
    mu_log <- log(mean_rr)
    sigma_log <- (log(RR_max) - log(RR_min)) / (2 * qnorm((1 + conf_level) / 2))
  } else {
    # If only RR_min and RR_max are provided
    mu_log <- (log(RR_min) + log(RR_max)) / 2
    sigma_log <- (log(RR_max) - log(RR_min)) / (2 * qnorm((1 + conf_level) / 2))
  }
  
  # Sample from Log-Normal distribution
  rlnorm(n, meanlog = mu_log, sdlog = sigma_log)
}

