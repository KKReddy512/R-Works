x<-rnorm(5) #printing random normal distribution
x

#R-specific programming loop

for (i in x){
  print(i)
}

print(x[1])
print(x[2])
print(x[3])

# Conventional programming loop
for (j in 1:5){
  print(x[j])
}

#----------------------#
#compare vectorized operations vs de-vectorized operations

n<-100 
a<-rnorm(n)
b<-rnorm(n)

# vectorized approach (takes less time because of R)
c<-a*b

# De-vectorised approach (takes long time)
d<- rep(NA, n)
for (i in 1:n){
  d[i]<-a[i]*b[i]
}

# both c and d are identical


