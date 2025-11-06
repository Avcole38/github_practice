#! TO DO:
#!   add call to here::i_am
library(rmarkdown)

here::i_am("code/04_render_report.R")
render(
  here::here("report.Rmd"),
  knit_root_dir = here::here()
)

