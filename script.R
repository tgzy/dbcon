data <- read.csv("/cloud/project/data_raw_small.csv",
                 encoding = "UTF-8")

library(tidyverse)
source("con.R")

res <- dbSendQuery(con, "SELECT * FROM `data_small`")
res_fetched <- dbFetch(res)
dbClearResult(res)

data_new <- data %>%
  mutate(timestamp_new = lubridate::ymd_hms(timestamp)) %>%
  select(-timestamp)

dbWriteTable(
  con,
  "data_small",
  data_new[1:1000,],
  append = TRUE,
  overwrite = FALSE,
  row.names = FALSE
)
