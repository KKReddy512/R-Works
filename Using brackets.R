x<- c(1, 324, 232, 55) #combine
y<- seq(210,250,5)      # Sequence
z<-rep("Hi!", 4)        # Repetition

w<- c("a", "b", "c", "d", "e")
w

W[1]
w[2]
w[-1] # does not consider first charater
w[-3] # does not consider 3rd charater

v<-w[-3]
v
w[1:3] # gets the vector from 1st to 3rd elments

w[c(1,3,5)]  # gets the corresponding elements in the vector w

w[c(-2,-4)] # skips the 2nd and 4th element

w[-3:-5]  # skips from 3rd to 5th element

w[-7]

w[-8]
