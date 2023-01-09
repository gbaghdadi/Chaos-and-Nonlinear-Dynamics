function dydt = vanderpoldemo(t,y,landa,p)

dydt = [y(2); (landa-y(1)^2)*y(2)-(p^2)*y(1)];