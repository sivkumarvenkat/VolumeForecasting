library(prophet)
library(data.table)

# Read data using Data.Table::fread, then detach data.table if there are package conflicts
EMScalls <- fread('EMScalls.csv')

library(dplyr)
detach("package:data.table", unload=TRUE)

callsFiltered <- EMScalls %>%
                    group_by(ds) %>%
                    arrange(desc(ds))
