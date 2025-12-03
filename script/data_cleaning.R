# load libraries
library(tidyverse)
library(quantmod)

# download dataset
getSymbols("^DJI", src = "yahoo",
           from = "2000-01-01", to = "2025-11-01", periodicity = "monthly")

# data cleaning
data <- tibble(date = index(DJI),
               open = as.numeric(DJI$DJI.Open),
               close = as.numeric(DJI$DJI.Close))
data$return <- (data$close - data$open) / data$open

# write the dataset
write_csv(data, "data/data.csv")