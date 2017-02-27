library(prophet)
library(data.table)

# Read data using Data.Table::fread, then detach data.table
EMScalls <- fread('EMScalls.csv')
#detach("package:data.table", unload=TRUE)

# The script below follows the Prophet quick-start guide

m <- prophet(EMScalls)

future <- make_future_dataframe(m, periods = 365)
