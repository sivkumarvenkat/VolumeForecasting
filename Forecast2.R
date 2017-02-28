library(prophet)
library(feather)
library(dplyr)
library(ggplot2)

# Calls saved as a feather data frame in the git repository. Faster than reading CSV lines.
callByDay <- read_feather("callByDay.feather")

m <- prophet(callByDay)

future <- make_future_dataframe(m, periods = 730)
tail(future)

forecast <- predict(m, future)
tail(forecast[c('ds', 'yhat', 'yhat_lower', 'yhat_upper')])

# Add holidays (add more...)

holidays <- data_frame(
  holiday = 'holidays',
  ds = as.Date(c('2015-01-01', '2016-01-01', '2015-12-31', '2016-12-31',
                 '2015-12-25', '2016-12-25', '2015-07-04', '2016-07-04',
                 '2015-05-05', '2016-05-05')),
  lower_window = -1,
  upper_window = 1
)

m <- prophet(df, holidays = holidays)
forecast <- predict(m,future)

plot(m, forecast)

prophet_plot_components(m, forecast)
