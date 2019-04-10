# Here we are creating function c and passing all the values to the function
MyFirstVector<-c(3, 45, 56, 732)
MyFirstVector
#checking all the values are numeric or not
is.numeric(MyFirstVector)
#checking the values if they are integers are not
is.integer(MyFirstVector)
#checking the vector is double or not
is.double(MyFirstVector)

#converting from numeric/double to integer
v2<-c(23L, 234L, 0L)
is.numeric(v2)
is.integer(v2)
is.double(v2)

v3<-c("a", "B23", "Hello")
v3
is.character(v3)
is.numeric(v3)

seq() #sequence - like :
rep() #replicate
seq(1,15)
seq(1:15)

seq(1,15,2)#1 to 15 numbers with step size 2
z<-seq(1,15,4)
z

rep(3,50) # replicate number 3 - 50 times
d<-rep(3,25)
d

rep("a", 5) # replicate a 5 times

x<-c(80,20)
a<-rep(80,20)
a
y<-rep(x,10)
y




