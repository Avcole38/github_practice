here::i_am("code/04_render_report.R")

config_list <- config::get()

library(rmarkdown)
report_filename <- paste0(
  "hiv_report_",
  "cutpoint", config_list$cutpoint,"_",
  "production", config_list$production,
  ".html"
)
# rendering a report in production mode
render ("hiv_report.Rmd",
       output_file = report_filename
       )

