"""rnorm, sep, c(combine), rep, print, is.numeric(), is.integer(),
is.character(), is.double()
typeof(), sqrt(), paste()
"""
# ? -> gives the information of the function. Eg. ?rnorm()
rnorm(5, 10, 8) # no.of values = 5, mean = 10, standard deviation = 8

?c()
?seq()
seq(from = 10, to = 20, by = 3)

x = c("a","b", "c" )
seq(from = 10, to = 20, along.with = x)

?rep()

rep(5:6, each = 5)
rep(x, times=3)

A<-c(10,15,20)
sqrt(A)
A**3
