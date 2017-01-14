*First Difference
tsset stockprice time
gen diff_x = D.x

gen diff_stockprice = D.stockprice

*Dickey Fuller Tests
. dfuller stockprice, regress lags(0)
. dfuller stockprice, trend regress lags(0)
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
. dfuller equityreitprice, trend regress lags(0)
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

. dfuller equityreitprice, regress lags(4)
. dfuller equityreitprice, trend regress lags(4)
. dfuller equityreitprice, noconstant regress lags(4)

*Differenced Variables
. dfuller diff_stockprice, regress lags(0)
. dfuller diff_stockprice, trend regress lags(0)
. dfuller stockprice, noconstant regress lags(0)

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

. dfuller diff_equityreitprice, regress lags(0)
. dfuller diff_equityreitprice, trend regress lags(0)
. dfuller diff_equityreitprice, noconstant regress lags(0)

. dfuller diff_equityreitprice, regress lags(1)
. dfuller diff_equityreitprice, trend regress lags(1)
. dfuller diff_equityreitprice, noconstant regress lags(1)

. dfuller diff_equityreitprice, regress lags(2)
. dfuller diff_equityreitprice, trend regress lags(2)
. dfuller diff_equityreitprice, noconstant regress lags(2)

. dfuller diff_equityreitprice, regress lags(3)
. dfuller diff_equityreitprice, trend regress lags(3)
. dfuller diff_equityreitprice, noconstant regress lags(3)

. dfuller diff_equityreitprice, regress lags(4)
. dfuller diff_equityreitprice, trend regress lags(4)
. dfuller diff_equityreitprice, noconstant regress lags(4)

*Engle-Granger Test
 regress stockprice equityreitprice
 predict residual, res
 line residual time, title(Residuals vs. time)
 twoway (scatter residual L.residual) (lfit residual L.residual), title(Residuals vs. Lagged Residuals)

