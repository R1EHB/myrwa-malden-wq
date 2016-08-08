# Malden River: Exploratory Water Quality Data Analysis

# load data ---------------------------------------------------------------

# loads data from the data/db and data/gis
# saves RData files in data/rda using RDS
source("load-csv-wq.R")
source("load-csv-precip.R")
source("load-gis.R")


# updating datasets -------------------------------------------------------

# exports wq and precip data from MyRWA database to csv files
# ONLY RUN to update the data/db.*csv files with a new
# data snapshot! So most of the time, you do not need to run this.
# REQUIRES: MyRWA Access DB file, myrwaR package, Windows, 32-bit R

# source("load-db-wq.R")
# source("load-db-precip.R")
