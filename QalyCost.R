QalyCost <- function(population_over_time = population_over_time, 
                     population_over_time_t = population_over_time_t) {
  
  # QALYs and Costs for no-treatment arm
  res_no_treat <- calculate_qalys_costs(population_over_time, qaly_weights, costs, discount_rate)
  no_treat_summary <- colSums(res_no_treat[, 2:3])
  
  # QALYs and Costs for treatment arm
  res_treat <- calculate_qalys_costs(population_over_time_t, qaly_weights, costs, discount_rate)
  treat_summary <- colSums(res_treat[, 2:3])
  
  # Combine results
  Det_CEA <- bind_rows(no_treat_summary, treat_summary) %>%
    mutate(Intervention = factor(c("No treatment", "Benznidazole")))
  
  # Calculate differences and ICER
  Det_CEA$AQALYs <- c(0, Det_CEA$QALYs[2] - Det_CEA$QALYs[1])
  Det_CEA$ACosts <- c(0, Det_CEA$Costs[2] - Det_CEA$Costs[1])
  Det_CEA$ICER <- Det_CEA$ACosts / Det_CEA$AQALYs
  
  return(Det_CEA)
}
