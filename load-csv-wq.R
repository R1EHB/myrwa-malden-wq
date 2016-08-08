# Load water quality data and stations from csv files in data/db/
# Save results to binary file in data/rdata/

source("packages.R")

wq <- read_csv("data/db/db_wq_malden.csv")
stn <- read_csv("data/db/db_stn_malden.csv")

out <- list(data = wq,
            stn = stn)

saveRDS(out, "data/rdata/wq_malden.rda")
