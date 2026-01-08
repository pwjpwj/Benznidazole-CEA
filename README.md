# Benznidazole CEA

# Cost-effectiveness analysis of benznidazole for chronic indeterminate Chagas disease

This repository contains the R code used to perform a cost-effectiveness evaluation of benznidazole for the treatment of chronic indeterminate Chagas disease. The analysis is based on a state-transition (Markov) model with calibrated transition parameters.
All code is written in R; execution using RStudio is strongly recommended to facilitate script execution and visualization.

# Repository structure and execution workflow

The analysis is organized into four main components that should be executed sequentially.

## 1. Model calibration

Model parameters governing disease progression and mortality were calibrated to reproduce observed mortality due to Chagas disease.

Step 1: Run BZN_Calib_01.R
This script performs the parameter sampling and runs multiple model iterations.

Step 2: Run BZN_Calib.R
This script evaluates calibration results and provides graphical outputs to identify the parameter set that best reproduces observed epidemiological data.

The calibrated parameter set is then used in all subsequent analyses.

## 2. Cost-effectiveness analysis (CEA)

Run BZN_CEA_01.R

This script performs the base-case deterministic cost-effectiveness analysis using the calibrated parameters and reports costs, health outcomes, and incremental cost-effectiveness results.

## 3. One-way sensitivity analysis (OWSA)

Run BZN_OWA.R

This script evaluates the impact of individual parameter uncertainty on model results by varying one parameter at a time over predefined ranges.

## 4. Probabilistic sensitivity analysis (PSA)

Run BZN_PSA.R

This script performs the probabilistic sensitivity analysis by simultaneously sampling parameters from their assigned probability distributions and generating uncertainty estimates for costs and outcomes.

# Notes

Scripts are intended to be executed in the order described above.

Parameter definitions, ranges, and calibration rationale are described in the Supplementary Material of the manuscript.

All analyses rely on the calibrated parameter set generated during the calibration step.
