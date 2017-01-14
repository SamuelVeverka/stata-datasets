*First Difference
tsset time
gen diff_x = D.x

gen diff_stockprice = D.stockprice

*Transform to Logs
gen lnstockprice=ln(stockprice)
gen lnequityreitprice=ln(equityreitprice)


*ACF
corrgram stockprice
ac lnstockprice
pac lnstockprice

corrgram ma_lnstockprice
ac ma_lnstockprice
pac ma_lnstockprice

corrgram MA_lnequityreitprice
ac ma_lnequityreitprice
pac ma_lnequityreitprice

corrgram lnequityreitprice
ac equityreitprice
pac lnequityreitprice

*Dickey Fuller Tests
. dfuller stockprice, regress lags(0)
. dfuller d.stockprice, trend regress lags(12)
. dfuller stockprice, noconstant regress lags(0)

. dfuller stockprice, regress lags(1)
. dfuller stockprice, trend regress lags(1)
. dfuller stockprice, noconstant regress lags(1)

. dfuller stockprice, regress lags(2)
. dfuller stockprice, trend regress lags(2)
. dfuller stockprice, noconstant regress lags(2)

. dfuller stockprice, regress lags(3)
. dfuller stockprice, trend regress lags(3)
. dfuller stockprice, noconstant regress lags(3)

. dfuller stockprice, regress lags(4)
. dfuller stockprice, trend regress lags(4)
. dfuller stockprice, noconstant regress lags(4)

. dfuller equityreitprice, regress lags(0)
. dfuller equityreitprice, trend regress lags(12)
. dfuller equityreitprice, noconstant regress lags(0)

. dfuller equityreitprice, regress lags(1)
. dfuller equityreitprice, trend regress lags(1)
. dfuller equityreitprice, noconstant regress lags(1)

. dfuller equityreitprice, regress lags(2)
. dfuller equityreitprice, trend regress lags(2)
. dfuller equityreitprice, noconstant regress lags(2)

. dfuller equityreitprice, regress lags(3)
. dfuller equityreitprice, trend regress lags(3)
. dfuller equityreitprice, noconstant regress lags(3)

. dfuller lnequityreitprice, regress lags(12)
. dfuller lnequityreitprice, trend regress lags(12)
. dfuller lnequityreitprice, noconstant regress lags(12)

*Differenced Variables
. dfuller diff_stockprice, regress lags(0)
. dfuller diff_stockprice, trend regress lags(0)
. dfuller diff_stockprice, noconstant regress lags(0)

. dfuller diff_stockprice, regress lags(1)
. dfuller diff_stockprice, trend regress lags(1)
. dfuller diff_stockprice, noconstant regress lags(1)

. dfuller diff_stockprice, regress lags(2)
. dfuller diff_stockprice, trend regress lags(2)
. dfuller diff_stockprice, noconstant regress lags(2)

. dfuller diff_stockprice, regress lags(3)
. dfuller diff_stockprice, trend regress lags(3)
. dfuller diff_stockprice, noconstant regress lags(3)

. dfuller diff_stockprice, regress lags(4)
. dfuller diff_stockprice, trend regress lags(4)
. dfuller diff_stockprice, noconstant regress lags(4)

*REITS

*USED FOR PAPER
. dfuller lnstockprice, trend lags(2)
. dfuller lnequityreitprice, trend lags(2)
. dfuller d.lnstockprice, trend lags(2)
. dfuller d.lnequityreitprice, trend lags(2)
estat ic
. dfuller residual

. dfuller lnstockprice, trend lags(6)
. dfuller lnequityreitprice, trend lags(6)
. dfuller d.lnstockprice, trend lags(6)
. dfuller d.lnequityreitprice, trend lags(6)


. dfuller lnstockprice, trend lags(12)
. dfuller d.stockprice, trend regress lags(12)
. dfuller equityreitprice, trend regress lags(12)
. dfuller lnequityreitprice, trend regress lags(6)


*Engle-Granger Test
 regress MA_lnstockprice MA_lnequityreitprice
 predict MA_residual, res
 line MA_residual time, title(Residuals vs. time)
 twoway (scatter MA_residual L.MA_residual) (lfit MA_residual L.MA_residual), title(Residuals vs. Lagged Residuals)
 . dfuller residual2, lags(6)
 
 
regress lnstockprice lnequityreitprice
predict residual, residual
regress D.ehat L.ehat L.D.ehat, noconstant 
. dfuller residual, lags(12)

 
regress ma_lnstockprice ma_lnequityreitprice
predict residual2, residual
regress D.ehat L.ehat L.D.ehat, noconstant 
. dfuller residual2, lags(6)


 
Johansen Jesulius
vecrank stockprice equityreitprice

vecrank ma_lnstockprice ma_lnequityreitprice


						





