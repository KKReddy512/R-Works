#matrix(), rbind(), cbind()

?matrix

my.data<-1:20

A<-matrix(my.data, 5, 5)
A

A[3,4]
# transpose of a matrix

B<-matrix(my.data, 5, 5, byrow = T)
B

B[4,3]

#rbind()

r1<-c("I", "am", "kiran")
r2<-c("This", "is", "R program")
r3<-c(1,2,3)

c1<-rbind(r1,r2,r3)
c1

#cbind()

c1<-1:5
c2<--6:-10

c3<-cbind(c1,c2)
c3

#Named vectors
Charlie<-1:5
Charlie

names(Charlie)   #returns NULL as there is no names assigned to charlie

#assign names to charlie

names(Charlie)<-c("a","b","c","d","e")
names(Charlie)
Charlie["d"]

#clear names
names(Charlie)<- NULL
Charlie

#Naming Matrix Dimensions
temp.vec <- 
  rep(c("a", "B", "22"), 3)
rep(c("a", "B", "22"), each = 3)


brav<- matrix(temp.vec, nrow = 3, ncol = 3)
brav

row.names(brav)<-c("one", "two", "three")
brav

colnames(brav)<-c("x","y","z")
brav

#Matrix operations
#Here we will use Games sections from the dataset for matrix operations
Games

rownames(Games)
colnames(Gmaes)
Games["LeBronJames", "2012"]
FieldGoals

round(FieldGoals/ Games,1) # rounding of to 1 decimal places

# how many minutes played by each palyer

round(MinutesPlayed/Games, 2)
MinutesPlayed

round(FieldGoalAttempts/FieldGoals,1)
  
# how to visualize this results using charts and graphs
?matplot
matplot(t(FieldGoals/FieldGoalAttempts), type = "b", pch=15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend=Players, pch = 15:18, 
       horiz = F, col = c(1:4,6))


#Subsetting

x<-c("a", "b", "c", "d", "e")
x
x[c(1,5)] # Getting 1st and 5th values from a vector
x[1] # getting 1st values from a vector
# In R every single variable is stored as a vector
Games
Games[1:3,6:10] # rows,columns - first 3 rows and 6 to 10 columns
Games[c(1,10),] # , --> and in rows selecting, "," --> from row to to row
Games[,c("2009", "2010")]
Games[1,]

is.matrix(Games[1,2])
is.vector(Games[1,2])
"""Games[1,] is a vector not a matrix. --- it is because
    R would drop dimension if there is only one row selected
    if we use 'drop' attribute to the dataset then it will 
    consider as a matrix
"""
Games[1:5,1:5,drop=F]
is.matrix(Games[1,5,drop=F])

# Visualizing subsets
Data<-MinutesPlayed[1:3,]
matplot(t(Data), type = "b", pch=15:18, 
        col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend=Players[1:3], pch = 15:18, 
       horiz = F, col = c(1:4,6))

# visualization only 1 player we will use drop = False
Data<-MinutesPlayed[1,,drop=F]
matplot(t(Data), type = "b", pch=15:18, 
        col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend=Players[1], pch = 15:18, 
       horiz = F, col = c(1:4,6))

# functions in R

myfunc <- function(data, rows = 1:10){
  Data<-data[rows,,drop=F]
  matplot(t(Data), type = "b", pch=15:18, 
          col = c(1:4,6))
  legend("bottomleft", inset = 0.01, legend=Players[rows], pch = 15:18, 
         horiz = F, col = c(1:4,6))
}

# Salary
myfunc(Salary)
myfunc(Salary/Games)
myfunc(Salary/FieldGoals)

# In-Game Metrics
myfunc(Points/Games)
myfunc(FieldGoals/FieldGoalAttempts)
myfunc(FieldGoalAttempts/Games)

#other observations
myfunc(MinutesPlayed/Games)
myfunc(Games)

#Time is valuable
myfunc(FieldGoals/MinutesPlayed)

#Player style
myfunc(Points/FieldGoals)

# home work challenge

