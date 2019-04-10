getwd()
setwd("C:\\Users\\Delhi\\Documents\\R")
getwd()

movies<-read.csv("P2-Movie-Ratings.csv")
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "Budget", "Year")
colnames(movies)
head(movies)
tail(movies)
summary(movies)

str(movies)

#|--------------Factors--------------------

# converting a non factor numberic variable to factor 
factor(movies$Year)
movies$Year <- factor(movies$Year)

summary(movies)
str(movies)

#--------------Aesthetics------------------

library(ggplot2)
# Setting x and Y coordinates along the axis
ggplot(data = movies, aes(x=CriticRating, y = AudienceRating))

# Add Geometry
ggplot(data = movies, aes(x=CriticRating, y = AudienceRating)) + 
  geom_point()

# Add Color
ggplot(data = movies, aes(x=CriticRating, y = AudienceRating, color = Genre)) + 
  geom_point()

# Add size

ggplot(data = movies, aes(x=CriticRating, y = AudienceRating, color = Genre,
                          size = Budget)) + 
  geom_point()

#|-----------Plotting with Layers---------|

p<-ggplot(data = movies, aes(x=CriticRating, y = AudienceRating, color = Genre,
                             size = Budget))
# Point plotting
p+geom_point()

# Lines plotting 
p+geom_line()

# Multiple layers plotting

p+geom_point()+geom_line()

#|----------Overriding Aesthitics---------|

q <-ggplot(data = movies, aes(x=CriticRating, y = AudienceRating, color = Genre,
                              size = Budget))

#add geom layer
q+geom_point()

#---------overriding aesthitics------------|

# exp 1
q+geom_point(aes(size=CriticRating))

# exp 2
q+geom_point(aes(color=Budget))

# Once we stop overriding the aesthetics it will display the original plotting
# but not the overridden plotting
q+geom_point()

# ex 3
# We can override even x and Y also. They are just conveying the information
q+geom_point(aes(x=Budget))

# Once if we change the x then scale(Axis) of x does not changes 
# to change it below is the addition
q+geom_point(aes(x=Budget)) + xlab("Budget in Millions")

# ex 4
q+geom_point() + geom_line()

# reduce the line size 
q+geom_point() + geom_line(size = 1)


#|---------Mapping vs Setting-----------|

r<- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating))
r+geom_point()

# Adding color in 2 ways
# 1. Mapping  -- What we have done so far
r<- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, color=Genre))
r + geom_point()
# It we want to map color based on a field data then use aesthetics
r+geom_point(aes(color = "DarkGreen"))
# 2. Setting -- If we want to use a color then we do not use aesthetics
r+geom_point(color = "DarKGreen")

# 1. Mapping 
r+geom_point(aes(size = Budget))
# 2. Setting
r+geom_point(size = 5)

#|----------Histograms and Density charts----------|

s<-ggplot(data = movies, aes(x=Budget)) 
# Here only x is given because r is calculating the mean and building histograms
# or Bins where statistics comes in.
s+geom_histogram(binwidth = 5)
# The graph is a skewed normal distribution where most movies have lower budget

# Adding color
s+geom_histogram(binwidth = 5, aes(fill=Genre))
# Adding border
s+geom_histogram(binwidth = 5, aes(fill=Genre), color = "Black")

#-------Density charts-----------
s+geom_density(aes(fill=Genre))
# Position = stack ==> displays all the types one after the other
s+geom_density(aes(fill=Genre), position = "stack")

#|---------starting layer tips-----------|

t<-ggplot(data=movies,aes(x=AudienceRating))
t+geom_histogram(binwidth = 10, fill="white", color="Blue")

# Another way for the above one

t<-ggplot(data=movies)
t+geom_histogram(binwidth = 10, aes(x=AudienceRating), 
                 fill="Green", color=("Black"))
#>>>> 4
# Here we no need to create variable 't' again.
t+geom_histogram(binwidth = 10, aes(x=CriticRating), 
                 fill="Green", color=("Black"))
# From the graphy we can say that Critic rating is more uniformly distributed

#>>>> 5

#|--------Statistical Transformations--------| --> Statistical Layer

u<-ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))

u + geom_point() + geom_smooth(fill=NA)

# Boxplots

u<-ggplot(data=movies, aes(x=Genre, y=AudienceRating, colour=Genre))

u+geom_boxplot(size=1.3) +geom_point()
#Hack /tip 
# jItter provides more visualization of the points
u+geom_boxplot(size=1.3) +geom_jitter()
#Another way  alpha gives brightness of point inside the box
u+geom_jitter()+geom_boxplot(size=1.2, alpha=0.5)

# Home work is to create for Critic Rating 
u<-ggplot(data=movies, aes(x=Genre, y=CriticRating, colour=Genre))
u+geom_boxplot(size=1.2,alpha=0.5)+geom_jitter()

#|-------Using Facets---------------------------|

v<-ggplot(data=movies, aes(x=Budget))
v+geom_histogram(binwidth = 5, aes(fill=Genre, colour="Black"))

#facets

v+geom_histogram(binwidth = 5, aes(fill=Genre), colour="Black") +
  facet_grid(Genre~., scales = "free")

# Using facets in scatterplots
w<-ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))

w+geom_point(size=2)+facet_grid(Genre~.)

w+geom_point(size=2)+facet_grid(.~Year)

w+geom_point(size=2)+facet_grid(Genre~Year)

# Adding smooth
w+geom_point(size=2)+facet_grid(Genre~Year)+geom_smooth()

# Adding budget to points
w+geom_point(aes(size=Budget))+facet_grid(Genre~Year)+geom_smooth()

# Still further improvement by handling coordinates
#|-----------Coordinates-----------|

# Limit our axis 
# how to zoom it for better view

m<-ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                           size=Budget, colour=Genre))
m+geom_point()

m+geom_point()+xlim(50,100)+ylim(50,100)

# Not works always
n<-ggplot(data = movies, aes(x=Budget))
n+geom_histogram(binwidth = 7, aes(fill=Genre), colour="Black")
n+geom_histogram(binwidth = 7, aes(fill=Genre), colour="Black")+ylim(0,50)
# xlim and ylim does not work well always because at cases it will 
# cut the data after the limit so we need to zoom in always

# How to do zoom in
n+geom_histogram(binwidth = 8, aes(fill=Genre), colour="Black")+
  coord_cartesian(ylim=c(0,50))

# Improve 1
w+geom_point(aes(size=Budget))+facet_grid(Genre~Year)
+geom_smooth()
+coord_cartesian(ylim=c(0,100))

#|--------Adding a Theme and create histograms-----------|
o<-ggplot(data=movies, aes(x=Budget))
h<-o+geom_histogram(binwidth = 8, aes(fill=Genre), colour="Black")
h

# Axes labels and legend
h+xlab("Money Axis")+ylab("Num of Movies")+
  ggtitle("Movies Budget Distribution")+
  theme(axis.title.x=element_text(colour = "DarkGreen", size=30),
        axis.title.y=element_text(colour = "Red", size=30),
        axis.text.x=element_text(size = 20),
        axis.text.y=element_text(size = 20),
        legend.title = element_text(size=20),
        legend.text = element_text(size = 20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(colour = "DarkBlue", size = 30,
                                  family = "Verdana"))

