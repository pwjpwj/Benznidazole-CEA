generate_rr_lognormal <- function(RR_min, RR_max, n = 10000, conf_level = 0.95, seed = NULL) {
  if (!is.null(seed)) set.seed(seed)  # Set seed for reproducibility
  
  # Compute mean and standard deviation in log-space
  mu_log <- (log(RR_min) + log(RR_max)) / 2
  sigma_log <- (log(RR_max) - log(RR_min)) / (2 * qnorm((1 + conf_level) / 2))
  
  # Sample from Log-Normal distribution
  rlnorm(n, meanlog = mu_log, sdlog = sigma_log)
}


