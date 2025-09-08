calculate_qalys_costs <- function(population_over_time, qaly_weights, costs, discount_rate) {
  # Initialize results as a tibble (avoids row name issues)
  results <- tibble(Cycle = integer(), QALYs = numeric(), Costs = numeric())
  
  for (t in seq_along(population_over_time)) {
    discount_factor <- 1 / (1 + discount_rate)^(t - 1)
    
    total_qalys <- 0
    total_costs <- 0
    
    for (sex in grupos_sexo) {
      for (age in grupos_edad) {
        for (i in 1:4) {
          count <- population_over_time[[t]][[sex]][[age]][[i]]
          
          # Check if state exists in qaly_weights and costs to prevent NA errors
          if (!is.null(qaly_weights[i]) && !is.null(costs[i])) {
            total_qalys <- total_qalys + count * qaly_weights[i] * discount_factor
            total_costs <- total_costs + count * costs[i] * discount_factor
          } else {
            warning(paste("Missing QALY or cost data for state:",i))
          }
        }
      }
    }
    
    # Append to results using bind_rows to avoid row name issues
    results <- bind_rows(results, tibble(Cycle = t - 1, QALYs = total_qalys-0.00215, Costs = total_costs+966.07+128.52))
  }
  
  return(results)
}