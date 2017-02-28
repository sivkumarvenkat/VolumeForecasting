library(prophet)
library(data.table)

# Read data using Data.Table::fread, then detach data.table if there are package conflicts
EMScalls <- fread('EMScalls.csv')

library(dplyr)
detach("package:data.table", unload=TRUE)

# The script below follows the Prophet quick-start guide

EMScalls <- mutate(EMScalls, y = log(y))

m <- prophet(EMScalls)

future <- make_future_dataframe(m, periods = 760)
