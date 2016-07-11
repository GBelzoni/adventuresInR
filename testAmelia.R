

tsvals = rnorm(100,0,10)
tsvals[1]
for(i in 1:100){tsvals[i] = tsvals[i] + i*0.05}
for(i in 2:100){tsvals[i]=tsvals[i] +tsvals[i-1]}

ts1 = ts(tsvals, start=c(2010,1))
plot(ts1)

tsvals_missing = tsvals
tsvals_missing[50:60] = NA

ts_missing = ts(tsvals_missing, start=c(2010,1))
plot(ts_missing)

library(Amelia)

ts_missing = as.data.frame(ts_missing[1:100])

ts_missing$Date = 2010:2109

aout = amelia(ts_missing, ts="Date",polytime = 2)

imp1 = aout$imputations[[1]]

plot(imp1$Date,imp1$ts_missing[1:100], type = 'l',col='red')
lines(imp1$Date,tsvals)
