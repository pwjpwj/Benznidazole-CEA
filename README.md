# Benznidazole CEA

**Cost-effectiveness analysis of benznidazole for chronic indeterminate Chagas disease**

This repository contains the R Markdown files used to perform a cost-effectiveness evaluation of benznidazole for the treatment of chronic indeterminate Chagas disease. The analysis is based on a state-transition (Markov) model with calibrated transition parameters.
All code is written in **R** and implemented as **R Markdown (.Rmd)** documents. Execution using **RStudio** is strongly recommended.

---

## Repository structure and execution workflow

The analysis is organized into four main components that should be executed sequentially. Each component is implemented as an R Markdown file, which can be run interactively or knitted in RStudio.

---

## 1. Model calibration

Model parameters governing disease progression and mortality were calibrated to reproduce observed mortality due to Chagas disease.

* **Step 1:** Open and run `BZN_Calib_01.Rmd`
  This file performs parameter sampling and executes multiple model iterations.

* **Step 2:** Open and run `BZN_Calib.Rmd`
  This file evaluates calibration results and provides graphical outputs to identify the parameter set that best reproduces observed epidemiological data.

The calibrated parameter set generated in this step is used in all subsequent analyses.

---

## 2. Cost-effectiveness analysis (CEA)

* Open and run `BZN_CEA_01.Rmd`

This file performs the base-case deterministic cost-effectiveness analysis using the calibrated parameters and reports total and incremental costs and health outcomes.

---

## 3. One-way sensitivity analysis (OWSA)

* Open and run `BZN_OWSA_INMB.Rmd`

This file evaluates the impact of individual parameter uncertainty on model results by varying one parameter at a time over predefined ranges.

---

## 4. Probabilistic sensitivity analysis (PSA)

* Open and run `BZN_PSA.Rmd`

This file performs the probabilistic sensitivity analysis by simultaneously sampling parameters from their assigned probability distributions and generating uncertainty estimates for costs and outcomes.

---

## Notes

* Files should be executed in the order described above.
* Each R Markdown file can be run chunk-by-chunk or knitted to HTML/PDF to reproduce results.
* Parameter definitions, calibration rationale, and uncertainty ranges are described in the Supplementary Material of the manuscript.
* All analyses rely on the calibrated parameter set obtained during the calibration stage.



