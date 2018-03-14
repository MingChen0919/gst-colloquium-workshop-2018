FROM rocker/rstudio

RUN R -e 'install.packages(c("ggplot2", "gridExtra", "stringr", "dplyr", "readr", "purrr"))'