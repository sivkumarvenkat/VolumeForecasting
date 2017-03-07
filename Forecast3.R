library(prophet)
library(feather)
library(tidyverse)

#EMScalls5yrs <- read_csv("./EMScalls5yrs.csv")
EMScalls5yrs <- read_feather("./EMScalls5yrs.feather")

m <- prophet(EMScalls5yrs)

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
