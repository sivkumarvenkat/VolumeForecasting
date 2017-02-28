library(prophet)
library(feather)
library(dplyr)
library(ggplot2)

# Calls saved as a feather data frame in the git repository. Faster than reading CSV lines.
callByDay <- read_feather("callByDay.feather")

m <- prophet(callByDay)

future <- make_future_dataframe(m, periods = 365)
tail(future)

forecast <- predict(m, future)
tail(forecast[c('ds', 'yhat', 'yhat_lower', 'yhat_upper')])

plot(m, forecast)
