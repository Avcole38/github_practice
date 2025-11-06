here::i_am("code/03_models.R")

data <- readRDS(
  file = here::here("output/data_clean.rds")
)

library (gtsummary)

#primary model

mod <- glm(
  ab_resistance ~ shield_glycans + region + env_length,
  data = data
)

primary_regression_table <-
tbl_regression(mod) |>
  add_global_p()

config_list <- config::get()
#secondary model
binary_mod <- glm(
  I(ab_resistance > config_list$cutpoint ) ~ shield_glycans + region + env_length,
  data = data,
  family = binomial()
)

secondary_regression_table <-
tbl_regression(binary_mod, exponentiate = TRUE) |>
  add_global_p()


both_models <-list(
  primary = mod,
  secondary = binary_mod
)
#saved file will be called both_models_cutpoint1.rds
both_models_filename <- paste0(
  "both_models_cutpoint",
  config_list$cutpoint,
  ".rds"
)
saveRDS(
  both_models,
  file = here::here("output",both_models_filename)
)

both_regression_tables <-list(
  primary = primary_regression_table,
  secondary = secondary_regression_table
)

#if cutpoint = 1
#file name will be both_regression_tabels_cutpoint1.rds
both_regression_tables_filename <- paste0(
  "both_regression_tables_cutpoint",
  config_list$cutpoint,
  ".rds"
  
)
saveRDS(
  both_regression_tables,
  file = here::here("output", both_regression_tables_filename)
)


print("models have been successfully created")