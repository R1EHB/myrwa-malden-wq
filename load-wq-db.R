# Load water quality data and stations from Access database
# Save results to csv files in data/db/

source("packages.R")

cfg <- yaml.load_file("config.yaml")

wq <- load_wq(path = cfg$db, sample_types = NULL, exclude_flags = FALSE)

ch <- db_connect(cfg$db)
stn <- db_table(ch, "Location") %>%
  rename(LocationID = ID)
close(ch)

wq_malden <- filter(wq, ProjectID %in% c("BASE", "TMDL", "CSORWM", "BHWQM"), WaterBodyID == "Malden River") %>%
  droplevels

stn_malden <- filter(stn, LocationID %in% as.character(unique(wq_malden$LocationID))) %>%
  droplevels

write_csv(wq_malden, path = "data/db/db_wq_malden.csv")
write_csv(stn_malden, path = "data/db/db_stn_malden.csv")
