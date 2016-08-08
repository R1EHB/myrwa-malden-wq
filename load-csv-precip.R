# Load precipitation data from csv file in data/db/
# Save results to binary file in data/rdata/

source("packages.R")

precip <- read_csv("data/db/db_precip.csv")

saveRDS(precip, "data/rdata/precip.rda")
