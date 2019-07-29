
#############################################################################
## Title: GET CAAPIRANGA DATASET FOR MBSI PACKAGE
## Desc: Obtain Caapiranga dataset to provide on the mbsi package
## Status: running
## Author: Erick A. Chacón-Montalvǽn
## Date: 2019-07-29
#############################################################################

# LOAD PACKAGES AND READ DATA ------------------------------------------------------

rm(list = ls())

library(day2day)
library(tidyverse)

path_proj <- get_path("food-security.ecm")
path_tidy <- file.path(path_proj, "4.TidyData")
path_data <- file.path(getwd_short("mbsi-aux"), "data")
(load(file.path(path_tidy, "rain_spi_indices.RData")))

# PROCESS AND SELECT DATA FOR MUNICIPALITIES UNDER STUDY ---------------------------

city_name <-"Caapiranga"
caapiranga <- stdata %>% filter(tolower(city_name) == tolower(nome) )
caapiranga <- transform(caapiranga, weeks2 = week %% (365 / 7))
caapiranga <- dplyr::select(caapiranga, rain, week, week_date)

# SAVE DATA -------------------------------------------------------------------------
save(caapiranga, file = file.path(path_data, "caapiranga.RData"))
