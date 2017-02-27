library(prophet)
library(tidyverse)
library(lubridate)
library(data.table)

# Read data using Data.Table
EMScalls2 <- fread('EMScalls2.csv')
View(EMScalls2)
# Detach data.table to avoid conflicts
detach("package:data.table", unload=TRUE)

