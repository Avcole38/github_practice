here::i_am("subproject1/code/02_make_scatter.R")

data <- readRDS(
  file = here::here("data/data_clean.rds")
)

library(ggplot2)

scatterplot <- 
  ggplot(data, aes(x = shield_glycans, y = ab_resistance)) +
    geom_point() +
    geom_smooth(method = lm) +
    theme_bw()

ggsave(
  file = here::here("subproject1", "output","scatterplot.png"),
  plot = scatterplot,
  device = "png"
)


