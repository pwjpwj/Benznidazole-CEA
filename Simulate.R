Simulate<-function(P_card, CaMorR, DiMorR, P_dig, horizon){
  
  states <- c("Chronic_Asymptomatic", "Cardiac", "Digestive", "Death")
  grupos_edad<-c("15-19", "20-24", "25-29", "30-34", "35-39", "40-44", "45-49", "50-54", "55-59", "60-64", "65-69")
  grupos_sexo<-c("Hombre", "Mujer")
  
  P_mort_m<-c(0.00015, 0.00037, 0.00044, 0.00054, 0.00077, 0.00095, 0.00161, 0.00289, 0.00543, 0.00893, 0.01401)
  P_mort_W<-c(0.00014, 0.00016, 0.00015, 0.00023, 0.00037, 0.00062, 0.00096, 0.00158, 0.00273, 0.00429, 0.00648)
  
  # Probabilidades de transición para el brazo SIN intervención
  transition_matrices <- list(
    "Hombre" = list(
      "15-19" = matrix(c(1-P_card-P_dig-P_mort_m[1], P_card, P_dig, P_mort_m[1],  
                         0.00, 1-P_dig-P_mort_m[1], P_dig, P_mort_m[1],  
                         0.00, 0.00, 1-P_mort_m[1], P_mort_m[1],  
                         0.00, 0.00, 0.00, 1.00),  
                       byrow = TRUE, nrow = 4),
      
      "20-24" = matrix(c(1-P_card-P_dig-P_mort_m[2], P_card, P_dig, P_mort_m[2],  
                         0.00, 1-P_dig-P_mort_m[2], P_dig, P_mort_m[2],  
                         0.00, 0.00, 1-P_mort_m[2], P_mort_m[2],  
                         0.00, 0.00, 0.00, 1.00),  
                       byrow = TRUE, nrow = 4),
      
      "25-29" = matrix(c(1-P_card-P_dig-P_mort_m[3], P_card, P_dig, P_mort_m[3],  
                         0.00, 1-P_dig-P_mort_m[3], P_dig, P_mort_m[3],  
                         0.00, 0.00, 1-P_mort_m[3], P_mort_m[3],  
                         0.00, 0.00, 0.00, 1.00),  
                       byrow = TRUE, nrow = 4),
      
      "30-34" = matrix(c(1-P_card-P_dig-P_mort_m[4], P_card, P_dig, P_mort_m[4],  
                         0.00, 1-P_dig-P_mort_m[4], P_dig, P_mort_m[4],  
                         0.00, 0.00, 1-P_mort_m[4], P_mort_m[4],  
                         0.00, 0.00, 0.00, 1.00),  
                       byrow = TRUE, nrow = 4), 
      
      "35-39" = matrix(c(1-P_card-P_dig-P_mort_m[5], P_card, P_dig, P_mort_m[5],  
                         0.00, 1-P_dig-P_mort_m[5], P_dig, P_mort_m[5],  
                         0.00, 0.00, 1-P_mort_m[5], P_mort_m[5],  
                         0.00, 0.00, 0.00, 1.00),  
                       byrow = TRUE, nrow = 4),
      
      "40-44" = matrix(c(1-P_card-P_dig-P_mort_m[6], P_card, P_dig, P_mort_m[6],  
                         0.00, 1-P_dig-P_mort_m[6], P_dig, P_mort_m[6],  
                         0.00, 0.00, 1-P_mort_m[6], P_mort_m[6],  
                         0.00, 0.00, 0.00, 1.00),  
                       byrow = TRUE, nrow = 4),
      
      "45-49" = matrix(c(1-P_card-P_dig-P_mort_m[7], P_card, P_dig, P_mort_m[7],  
                         0.00, 1-P_dig-P_mort_m[7], P_dig, P_mort_m[7],  
                         0.00, 0.00, 1-P_mort_m[7], P_mort_m[7],  
                         0.00, 0.00, 0.00, 1.00),  
                       byrow = TRUE, nrow = 4),
      
      "50-54" = matrix(c(1-P_card-P_dig-P_mort_m[8], P_card, P_dig, P_mort_m[8],  
                         0.00, 1-P_dig-P_mort_m[8], P_dig, P_mort_m[8],  
                         0.00, 0.00, 1-P_mort_m[8], P_mort_m[8],  
                         0.00, 0.00, 0.00, 1.00), 
                       byrow = TRUE, nrow = 4),
      
      "55-59" = matrix(c(1-P_card-P_dig-P_mort_m[9], P_card, P_dig, P_mort_m[9],  
                         0.00, 1-P_dig-P_mort_m[9], P_dig, P_mort_m[9],  
                         0.00, 0.00, 1-P_mort_m[9], P_mort_m[9],  
                         0.00, 0.00, 0.00, 1.00),
                       byrow = TRUE, nrow = 4),
      
      "60-64" = matrix(c(1-P_card-P_dig-P_mort_m[10], P_card, P_dig, P_mort_m[10],  
                         0.00, 1-P_dig-P_mort_m[10], P_dig, P_mort_m[10],  
                         0.00, 0.00, 1-P_mort_m[10], P_mort_m[10],  
                         0.00, 0.00, 0.00, 1.00), 
                       byrow = TRUE, nrow = 4),
      
      "65-69" = matrix(c(1-P_card-P_dig-P_mort_m[11], P_card, P_dig, P_mort_m[11],  
                         0.00, 1-P_dig-P_mort_m[11], P_dig, P_mort_m[11],  
                         0.00, 0.00, 1-P_mort_m[11], P_mort_m[11],  
                         0.00, 0.00, 0.00, 1.00),  
                       byrow = TRUE, nrow = 4)
      
    ),
    "Mujer" = list(
      "15-19" = matrix(c(1-P_card-P_dig-P_mort_W[1], P_card, P_dig, P_mort_W[1],  
                         0.00, 1-P_dig-P_mort_W[1], P_dig, P_mort_W[1],  
                         0.00, 0.00, 1-P_mort_W[1], P_mort_W[1],  
                         0.00, 0.00, 0.00, 1.00),  
                       byrow = TRUE, nrow = 4),
      
      "20-24" = matrix(c(1-P_card-P_dig-P_mort_W[2], P_card, P_dig, P_mort_W[2],  
                         0.00, 1-P_dig-P_mort_W[2], P_dig, P_mort_W[2],  
                         0.00, 0.00, 1-P_mort_W[2], P_mort_W[2],  
                         0.00, 0.00, 0.00, 1.00),  
                       byrow = TRUE, nrow = 4),
      
      "25-29" = matrix(c(1-P_card-P_dig-P_mort_W[3], P_card, P_dig, P_mort_W[3],  
                         0.00, 1-P_dig-P_mort_W[3], P_dig, P_mort_W[3],  
                         0.00, 0.00, 1-P_mort_W[3], P_mort_W[3],  
                         0.00, 0.00, 0.00, 1.00),  
                       byrow = TRUE, nrow = 4),
      
      "30-34" = matrix(c(1-P_card-P_dig-P_mort_W[4], P_card, P_dig, P_mort_W[4],  
                         0.00, 1-P_dig-P_mort_W[4], P_dig, P_mort_W[4],  
                         0.00, 0.00, 1-P_mort_W[4], P_mort_W[4],  
                         0.00, 0.00, 0.00, 1.00),  
                       byrow = TRUE, nrow = 4),
      
      "35-39" = matrix(c(1-P_card-P_dig-P_mort_W[5], P_card, P_dig, P_mort_W[5],  
                         0.00, 1-P_dig-P_mort_W[5], P_dig, P_mort_W[5],  
                         0.00, 0.00, 1-P_mort_W[5], P_mort_W[5],  
                         0.00, 0.00, 0.00, 1.00),  
                       byrow = TRUE, nrow = 4),
      
      "40-44" = matrix(c(1-P_card-P_dig-P_mort_W[6], P_card, P_dig, P_mort_W[6],  
                         0.00, 1-P_dig-P_mort_W[6], P_dig, P_mort_W[6],  
                         0.00, 0.00, 1-P_mort_W[6], P_mort_W[6],  
                         0.00, 0.00, 0.00, 1.00),  
                       byrow = TRUE, nrow = 4),
      
      "45-49" = matrix(c(1-P_card-P_dig-P_mort_W[7], P_card, P_dig, P_mort_W[7],  
                         0.00, 1-P_dig-P_mort_W[7], P_dig, P_mort_W[7],  
                         0.00, 0.00, 1-P_mort_W[7], P_mort_W[7],  
                         0.00, 0.00, 0.00, 1.00),  
                       byrow = TRUE, nrow = 4),
      
      "50-54" = matrix(c(1-P_card-P_dig-P_mort_W[8], P_card, P_dig, P_mort_W[8],  
                         0.00, 1-P_dig-P_mort_W[8], P_dig, P_mort_W[8],  
                         0.00, 0.00, 1-P_mort_W[8], P_mort_W[8],  
                         0.00, 0.00, 0.00, 1.00), 
                       byrow = TRUE, nrow = 4),
      
      "55-59" = matrix(c(1-P_card-P_dig-P_mort_W[9], P_card, P_dig, P_mort_W[9],  
                         0.00, 1-P_dig-P_mort_W[9], P_dig, P_mort_W[9],  
                         0.00, 0.00, 1-P_mort_W[9], P_mort_W[9],
                         0.00, 0.00, 0.00, 1.00),
                       byrow = TRUE, nrow = 4),
      
      "60-64" = matrix(c(1-P_card-P_dig-P_mort_W[10], P_card, P_dig, P_mort_W[10],  
                         0.00, 1-P_dig-P_mort_W[10], P_dig, P_mort_W[10],  
                         0.00, 0.00, 1-P_mort_W[10], P_mort_W[10], 
                         0.00, 0.00, 0.00, 1.00),
                       byrow = TRUE, nrow = 4),
      
      "65-69" = matrix(c(1-P_card-P_dig-P_mort_W[11], P_card, P_dig, P_mort_W[11],  
                         0.00, 1-P_dig-P_mort_W[11], P_dig, P_mort_W[11],  
                         0.00, 0.00, 1-P_mort_W[11], P_mort_W[11], 
                         0.00, 0.00, 0.00, 1.00),
                       byrow = TRUE, nrow = 4)
    )
  )
  
  # Initial population distribution (Distribución según INE (personas de sudamérica), casos según Navarro et al 2022)
  population <- list()
  Chr_Asym_H<-c(1624, 2767, 3867, 4136, 3554, 3166, 2292, 1496, 933, 552, 307)
  names(Chr_Asym_H)<-grupos_edad
  
  for (age  in grupos_edad) {
    population[["Hombre"]][[age]] <- c(Chronic_Asymptomatic = Chr_Asym_H[age], 
                                       Cardiac = 0, 
                                       Digestive = 0, 
                                       Death = 0)
  }
  
  Chr_Asym_M<-c(1355, 2571, 4170, 4378, 4053, 3861, 3091, 2521, 1939, 1369, 1014)
  names(Chr_Asym_M)<-grupos_edad
  for (age  in grupos_edad) {
    population[["Mujer"]][[age]] <- c(Chronic_Asymptomatic = Chr_Asym_M[age], 
                                      Cardiac = 0, 
                                      Digestive = 0, 
                                      Death = 0)
  }
  
  # Simulating the non treatment arm
  # Simulation loop
  
  # Initialize storage for population evolution
  population_over_time <- list()
  prop_moving <- 0.2  # 20% of the population moves each year as the year groups are of 5 years
  for (t in 1:horizon) {
    cat("Year:", t, "\n")
    
    new_population <- list()
    
    for (sex in grupos_sexo) {
      new_population[[sex]] <- list()
      for (age in grupos_edad) {
        new_population[[sex]][[age]] <- rep(0, length(states))  # Initialize empty state vector
      }
    }
    
    for (sex in grupos_sexo) {
      for (age in grupos_edad) {
        # Get the transition matrix
        trans_mat <- matrix(as.numeric(trans_mat), nrow = 4, ncol = 4)
      
        # Current population in this (sex, age) group
        current_pop <- unlist(population[[sex]][[age]])
        current_pop<-matrix(as.numeric(current_pop), nrow = 1)
        # Compute next year's population distribution
        
        new_pop <- as.numeric(current_pop %*% trans_mat)
        
        # Move individuals to the next age group if possible
        next_age_group <- switch(age,
                                 "15-19" = "20-24",
                                 "20-24" = "25-29",
                                 "25-29" = "30-34",
                                 "30-34" = "35-39",
                                 "35-39" = "40-44",
                                 "40-44" = "45-49",
                                 "45-49" = "50-54",
                                 "50-54" = "55-59",
                                 "55-59" = "60-64",
                                 "60-64" = "65-69",
                                 age  # If the age group is not in the switch statement, keep it
        )
        
        # Store updated population
        if (next_age_group != age) {
          if (is.null(new_population[[sex]][[next_age_group]])) {
            new_population[[sex]][[next_age_group]] <- new_pop
          } else {
            new_population[[sex]][[next_age_group]] <- new_population[[sex]][[next_age_group]] + prop_moving *new_pop
            new_population[[sex]][[age]] <- (1 - prop_moving) * new_pop
          }
        } else {
          new_population[[sex]][[age]] <- new_pop
        }
      }
    }
    
    # Save population state at this time step
    population_over_time[[t]] <- population
    
    # Update population for the next cycle
    population <- new_population
  }
  return(population_over_time)
}