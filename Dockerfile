FROM rocker/rstudio

RUN apt update && apt-get install libcurl4-openssl-dev
RUN apt-get install libxml2-dev

RUN R -e 'install.packages(c("rvest", "xml2", "gridExtra", "ggnetwork", "tidyverse"))'