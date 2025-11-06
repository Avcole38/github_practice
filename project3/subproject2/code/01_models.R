here::i_am("subproject2/code/01_models.R")

data <- readRDS(
  file = here::here("data/data_clean.rds")
)

library(gtsummary)

mod <- glm(
  ab_resistance ~ shield_glycans + region + env_length,
  data = data
)

primary_regression_table <- 
  tbl_regression(mod) |>
    add_global_p()

binary_mod <- glm(
  I(ab_resistance > 1) ~ shield_glycans + region + env_length,
  data = data,
  family = binomial()
)

secondary_regression_table <- 
  tbl_regression(binary_mod, exponentiate = TRUE) |>
    add_global_p()

both_regression_tables <- list(
  primary = primary_regression_table,
  secondary = secondary_regression_table
)
saveRDS(
  both_regression_tables,
  file = here::here("subproject2", "output","models")
)

