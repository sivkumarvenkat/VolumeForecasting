library(prophet)
library(data.table)

# Read data using Data.Table::fread, then detach data.table if there are package conflicts
EMScalls <- fread('EMScalls.csv')

library(dplyr)
detach("package:data.table", unload=TRUE)

callsFiltered <- EMScalls %>%
                    group_by(ds) %>%
                    arrange(desc(ds))

# Testing date parsing. Read in the original CSV for this as 'test'. (It doesn't work). #

test %>%
   mutate(day = format(date, "%d"), 
          month = format(date, "%m"), 
          year = format(date, "%Y")) %>%
   group_by(day) %>%
   summarise(total = sum(value))