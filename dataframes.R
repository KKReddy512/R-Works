?read.csv()

# Method 1: select the file manually
stats<-read.csv(file.choose())

#Method 2: Set Working Directory and Read data

getwd()
# For Windows
setwd("C:\\Users\\Delhi\\Documents\\R")
# For Mac os
#setwd("/Users/....")

rm(stats) # Remove the stats object

stats<-read.csv("P2-Demographic-Data.csv")

#|---------Exploring data-------------|
stats
nrow(stats) # no. of rows
ncol(stats) # no. of columns

head(stats) # Top 6 rows shows with column names

head(stats, n=10) # Gives top 10 rows with column names

tail(stats, n=8) # Shows bottom 6 rows

str(stats) 
""" str() --> Assigns numeric values to each column of the data set
              In R it is called as Factors 
              It is one to deal with categorical values in R
    runif() --> random variables distributed uniformaly
    rnorm() --> random normal distrubution
"""
summary(stats) # tells the statistics of the data sets like highest, lowest

# |-------Using the $ sign--------|
head(stats)
stats[3,3] # getting Angola birth rate

stats[3, "Birth.rate"] # row number, column heading
# In dataframe the rows have numbers but columns have heading which is 
# exactly same as excel

# $ sign doesnot work for matrices, but it does work for dataframes

stats$Internet.users  # Return whole column of the Internet users

stats$Internet.users[2:5] # Return the specified fields

stats[,"Internet.users"] # without $ sign produces same results as \
                         # above stmt "stats$Internet.users"

levels(stats$Income.Group) # Gives the distinct values of a column using levels function

# |--------------dataframe basic operations-----------|
stats[1:10,]  # subsetting
stats[,1:3] # gets all rows but first 3 columns
stats[c(1,100),] # Gets 1st and 100th row with all columns
# Remember how the [] works

""" Generally in matrix if we extract 1st row, then system would remove 
row name/ dimension and turn the row into a vector. Does these happen in a 
dataframe, no it does not look like it because the row number still exists"""

stats[1,]

is.data.frame(stats[1,]) # If we extract a row it is dataframe
is.data.frame(stats[,1]) # If we extract a column it is not a dataframe

is.data.frame(stats[,1,drop=F]) # here dimensions are dropped 

head(stats)

stats$Birth.rate*stats$Internet.users # Operation multiple of 2 columns

stats$Birth.rate+stats$Internet.users # Operation additon of 2 columns

head(stats)

# Addition of new column
stats$Mycalc <- stats$Birth.rate * stats$Internet.users  
head(stats)

# Addition of new column

stats$xyz <- 1:5 # Replicate 1 to 5 for all the 195 columns 
head(stats)

# Remove a column
stats$xyz<- NULL
head(stats)

stats$Mycalc<- NULL
head(stats)

#|------------Filtering a dataframe---------|
# Forex: Delete some rows, changing values of some rows

Filter <- stats$Internet.users < 2  # In return we will get vector of True/False for the 
                          # condition that satisfies or not

stats[Filter,] # it will display all the rows which satisfies the condition

# Gets the rows which satisfies the condition
stats[stats$Birth.rate > 40 & stats$Internet.users > 2,] 

stats[stats$Income.Group == "Lower middle income",]

levels(stats$Income.Group) # Levels function gives the distinct values of a column

stats[stats$Country.Name == "India",]


#-----------Introductions to Qplot-------------

qplot(data = stats, x = Internet.users)

# x --> Row mapping, y --> Column Mapping, 
# size == I(10) --> Size of the plotting
# Geom --> Type of plotting (Boxplot, scatterplot)
qplot(data = stats, x = Income.Group, y = Birth.rate, size = I(2),
      color = "Blue")

qplot(data = stats, x = Income.Group, y = Birth.rate,
      geom = "boxplot")

#|---------Visualising what we need------------|
qplot(data = stats, x = Internet.users, y = Birth.rate)
qplot(data = stats, x = Internet.users, y = Birth.rate ,size = I(3))

qplot(data = stats, x = Internet.users, y = Birth.rate, size = I(2),
      color = "blue")
qplot(data = stats, x = Internet.users, y = Birth.rate, size = I(2),
      color = Internet.users)
qplot(data = stats, x = Internet.users, y = Birth.rate, size = I(2),
      color = Income.Group)
  
# |-------Creating data frame-------------|
# Get the dataset from superdatascience.com/rcourse -> section5/ Country Region Vectors
mydata <- data.frame(Codes_2012_Dataset, Countries_2012_Dataset,
                     Regions_2012_Dataset)
head(mydata)

colnames(mydata) <- c("Country Code", "Country", "Region")
head(mydata)

rm(mydata)  # --> Deletes the dataframe

mydata<-data.frame(Codes = Codes_2012_Dataset, Country = Countries_2012_Dataset,
         Region=Regions_2012_Dataset)

head(mydata)

tail(mydata)

summary(mydata[55:60,])

# -----------Merging dataframes---------------

# combining Mydata "dataset" and "stats" data set

head(stats)

head(mydata)

merged <- merge(stats, mydata, by.x = "Country.Code", by.y = "Codes")
merged[1:5,]

merged$Country <- NULL
str(merged)
head(merged)

# --------------Visualizing the above merged data------------------

qplot(data = merged, x = Internet.users, y = Birth.rate)

qplot(data = merged, x = Internet.users, y = Birth.rate, color = Region)

# shape --> Change the shape of the points in the plotting eg. 15 -> Square, 19 -> Round 
# Size --> specify the size the points in the graph
qplot(data = merged, x = Internet.users, y = Birth.rate, color = Region,
      shape = I(23))

# Transparency 
qplot(data = merged, x = Internet.users, y = Birth.rate, color = Region,
      shape = I(15), size = I(2), alpha=I(0.6))
# Title
qplot(data = merged, x = Internet.users, y = Birth.rate, color = Region,
      shape = I(19), size = I(2), alpha=I(0.6),
      main = "Birth Rate vs Internet Users")


