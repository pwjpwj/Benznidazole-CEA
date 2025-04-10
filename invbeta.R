invbeta<-function(mu=0.019, low=0.013, high=0.03, n=5){
  # Given parameters
  mu <- 0.019   # Mean incidence rate
  low <- 0.013  # Lower bound of 95% CI
  high <- 0.03  # Upper bound of 95% CI
  
  # Approximate standard deviation from CI
  sigma <- (high - low) / (2 * 1.96)
  
  # Solve for alpha and beta
  alpha <- mu * ((mu * (1 - mu) / sigma^2) - 1)
  beta <- (1 - mu) * ((mu * (1 - mu) / sigma^2) - 1)
  
  # Check values
  alpha; beta
  
  # Sample incidence from Beta distribution
  sample_incidence <- rbeta(n, alpha, beta)
  sample_incidence
}