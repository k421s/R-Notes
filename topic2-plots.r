#try examples 
#hw example slides
#Assignment #1: use R dataset iris for these exercises
#head, tail, summary, 

#Try slides 
#hw slides
#homework Assignment at the end

#concat and print
iter <- stats::rpois(1, lambda = 10)
cat("iteration = ", iter <- iter + 1, "\n")
cat(paste(letters, 100* 1:26), fill = TRUE, labels = paste0("{", 1:10, "}:"))

#paste function
paste0(1:12)
paste(1:12) # same
as.character(1:12) # same

## vectorized way.
(nth <- paste0(1:12, c("st", "nd", "rd", rep("th", 9))))

## Notice that the recycling rules make every input as long as the longest input.
paste(month.abb, "is the", nth, "month of the year.")
paste(month.abb, letters)

#paste function example
## You can change the separator by passing a sep argument
## which can be multiple characters.
paste(month.abb, "is the", nth, "month of the year.", sep = "_*_")

## To collapse the output into a single string, pass a collapse argument.
paste0(nth, collapse = ", ")

## For inputs of length 1, use the sep argument rather than collapse
paste("1st", "2nd", "3rd", collapse = ", ") # probably not what you wanted
paste("1st", "2nd", "3rd", sep = ", ")


#print function
m1 <- sample(month.abb, 100, replace = TRUE)
m2 <- sample(month.abb, 100, replace = TRUE)
(x <- table(m1, m2))
print(x)
print(x, zero.print = ".")

print(x, digits =1)
print(x,quote = FALSE)
print(x,max.levels = NULL)
print(x,width = 1)
print(x,na.print = NULL)

#scan function
x <- scan()

#creating a table of poisson distributed random numbers
y <- rpois(1500,1.5)
table(y)

#convert this table object into a dataframe 
short<-as.data.frame(table(y))
short

index<-rep(1:7,short$Freq)
length(index)


#data table Example
install.packages("data.table") 
install.packages("curl")
library(data.table)
mydata = fread("https://github.com/arunsrinivasan/satrdays-workshop/raw/master/flights_2014.csv")

#describe data
names(mydata)
head(mydata)
tail(mydata)


#data.table Examples
# returns a vector
dat1 = mydata[ , origin]
# returns a data.table
dat1 = mydata[ , .(origin)]

#return a column based on position
dat2 =mydata[, 2, with=FALSE]

#keeping multiple columns
dat3 = mydata[, .(origin, year, month, hour)]

#keeping columns 2 though 4
dat4 = mydata[, c(2:4), with=FALSE]

#data.table examples

DF = data.frame(x = c(1,1,1,2,2,3,3,3), y = 1:8)

## (1) normal way
DF[DF$x > 1, ] # data.frame needs that ',' as well

## (2) using with
DF[with(DF, x > 1), ]

###selecting or keeping records
ans <- flights[, .(.N), by = .(origin)]
ans

## or equivalently using a character vector in 'by’
ans <- flights[, .(.N), by = "origin"]


######### HW slides from topic 2

#paste function (again)
## You can combine the sep and collapse arguments together.
paste(month.abb, nth, sep = ": ", collapse = "; ")

## Using paste() in combination with strwrap() can be useful
## for dealing with long strings.
(title <- paste(strwrap(
  "Stopping distance of cars (ft) vs. speed (mph) from Ezekiel (1930)",
  width = 30), collapse = "\n"))
plot(dist ~ speed, cars, main = title)

#print function
m1 <- sample(month.abb, 100, replace = TRUE)
m2 <- sample(month.abb, 100, replace = TRUE)
(x <- table(m1, m2))
print(x)
print(x, zero.print = ".")


###Exercise 1
#Create a function that will return the sum of 2 integers.
E1 <- function(a,b){
  a + b
}
E1(3,3)

#checking for integer
isIntegerTest <- function(x){
  Test <- all.equal(x, as.integer(x), check.attributes = FALSE)
  isTRUE(Test)
}

Eq <- function(a,b){
  if(isIntegerTest(a) && isIntegerTest(b)){
    a + b
  }else{
    NA
  }
  
}
Eq(3,3)

#absolutely zero error checking though


###exercise 2
#Create a function what will return TRUE if a given integer is inside a vector
##Example argument(c(1:10), 10)

#for each
argument <- function(b,a)
{
  a%in%b
}
argument(c(1:10), 10)



###Exercise 3
#Create a function that given a data frame will print by screen the name of the column and the class of data if it
#contains (e.g. Variable1 is Numeric).

f.class <- function (df) {
  for (i in 1:ncol(df)) {
    cat(names(df)[i], "is", class(df[, i]), "\n")
  }
}
f.class(cars)



###Exercise 4
#Create the function unique, which given a vector will return a new vector with the elements of the first vector with
#duplicated elements removed. 

f.uniq <- function (v) {
  s <- c()
  
  for(i in 1:length(v)) {
    if(sum(v[i] == s) == 0) {
      s <- c(s, v[i])
    }
  }
  s
}
f.uniq(c(9, 9, 1, 1, 1, 0))


####Exercise 5 HW
#Create a function that given a vector and an integer will return how many times the integer appears
#inside the vector. Hint: Previous functions should be helpful here.

f.count <- function (v, x) {
  count <- 0
  
  for (i in 1:length(v)) {
    if (v[i] == x) {
      count <- count + 1
    }
  }
  count
}
f.count(c(1:9, rep(10, 100)), 10)


# Exercise 6

desi <- function(x, med=FALSE) {
  
  mean <- round(mean(x), 1)
  stdv <- round(sd(x), 1)
  cat("Mean is:", mean, ", SD is:", stdv, "\n")
  
  if(med) {
    median <- median(x)
    cat("Median is:", median , "\n")
  }
}
desi(1:10, med=TRUE)


## Mean is: 5.5 , SD is: 3 
## Median is: 5.5
# Exercise 7 

f.div <- function(n) {
  i <- 2
  counter <- 0
  
  while(i <= n/2) {
    if(n%%i==0) {
      counter <- counter + 1
      cat (i ,"\n")
    }
    i <- i + 1
  }
  counter
}
f.div(13)
## [1] 0
f.div(16)


# Exercise 8 

f.na <- function (df, otherna) {
  for(i in 1:ncol (df)) {
    for(j in 1:nrow (df)) {
      if(df[j,i] == otherna) {
        df[j,i] <- NA
      }
    }
  }
  df
}
carsnew <- f.na(cars, 10)


#reading from the web --data scraping

data2 <- read.table("http://www.bio.ic.ac.uk/research/mjcraw/ther
book/data/cancer.txt",header=T)
head(data2)


###input and output formats
data <-read.table("c:\\temp\\catdata.txt",header=T)
attach(data)
names(data)
model<-lm(y~soil)

unique(data$soil)

##input and output formats
summary.aov(model)

df1<-unlist(summary.aov(model)[[1]] [1])[1] = 2
df2<-unlist(summary.aov(model)[[1]] [1])[2] = 27
ss1<-unlist(summary.aov(model)[[1]] [2])[1] = 99.2
ss2<-unlist(summary.aov(model)[[1]] [2])[2] = 315.5

unlist(summary.aov(model))

##input and output formats
  cat("Data.Table Package table","\n")
  cat("Source","\t\t","SS","\t","d.f.","\t","MS","\t\t","F","\n")
  cat("Treatment","\t",ss1,"\t",df1,"\t",ss1/df1,"\t\t",(ss1/df1)/(ss2/df2),"\n")
  cat("Error","\t\t",ss2,"\t",df2,"\t",ss2/df2,"\n")
  cat("Total","\t\t",ss1 + ss2,"\t",df1 + df2,"\n")

  
###Homework Exercises from page 79

##Exercise 1
  #Print out the following vector as prices in dollars (to the nearest cent): c(14.3409087337707, 13.0648270623048,
                                                                              # 3.58504267621646, 18.5077076398145, 16.8279241011882). Example: $14.34
  prices <- c(
    14.3409087337707, 13.0648270623048, 3.58504267621646, 18.5077076398145,
    16.8279241011882
  )
  sprintf("$%.2f", prices)
  
  
  
##Exercise 2
  #Using these numbers c(25, 7, 90, 16) make a vector of filenames in the following format: file_025.txt. That is, left pad the
  #numbers so they are all three digits.
  
  fn <- c(25, 7, 90, 16)
  sprintf("file_%03d.txt", fn)

##Exercise 4
  #Print out the following haiku on three lines, right aligned, with the help of cat. c("Stay the patient course.", "Of little
#worth is your ire.", "The network is down.").
  
  poeml <- c("Stay the patient course.", "Of little worth is your ire.", "The network is down.")
  nmax <- max(nchar(poeml))
  cat(sprintf("%*s", nmax, poeml), sep = "\n")
  
  
###fitting models using by
  by(worms, Vegetation, function(x) lm(Worm.density ~ Soil.pH, data=x))

  
###Homework at the end of all the slides
#   Assignmnt #1: Use the R dataset iris for these exercises
#   a) Perform the following on the dataset:
#     1. head
#     2. tail
#     3. Summary
#   b) Get all rows of Species ‘versicolor’ in a new data frame. Call this data frame: ‘iris.vers’
#   c) Create a vector called ‘sepal.dif’ with the difference between ‘Sepal.Length’ and
#     ‘Sepal.Width’of ‘versicolor’ plants.
#   d) Update (add) ‘iris.vers’ with the new column ‘sepal.dif’.
#   e) Filter for all data of Species ‘virginica’ with a ‘Sepal.Width’ of greater than 3.5. Store the results in
#     a dataframe called ‘iris.filtered’
#   f) Get a new object which contains only the odd values of ‘Sepal.Length. Store the results in a
#     dataframe called ‘iris.odd’
#   g) Calculate mean of each of the numeric variables with function sapply(). - First find out which
#     columns are numeric., then for example code: sapply(iris[1:4],mean)
  
## a)
  #head
  head(iris)
  tail(iris)
  summary(iris)
  
###b)
  iris.vers = subset(iris, Species == "versicolor"); iris.vers
  
###c)
  sepal.dif = iris.vers$Sepal.Length - iris.vers$Sepal.Width; sepal.dif
  
###d)  
  iris.vers = data.frame(iris.vers, sepal.dif); head(iris.vers)

###e)
  library(dplyr)
  filter(iris, Sepal.Width > 3.5, Species =="virginica")
  
###f)
  sep.lengthodd = iris[c(T,F),1]

###g)
  sapply(iris[, -5], 2, mean)
  
  
###homework for flight data
  # 1. Had an arrival delay of two or more hours
  # 2. Flew to Houston (IAH or HOU)
  # 3. Were operated by United, American, or Delta
  # 4. Arrived more than two hours late, but didn’t leave late
  # 5. Were delayed by at least an hour, but made up over 30 minutes in flight
  # 6. Departed between midnight and 6am (inclusive)
  # 7. How many flights have a missing dep_time? What other variables are
  # missing? What might these rows represent?
  #   
  
# 1. filter for two or more hours
  filter(flights, arr_delay >= 120)
  
# 2. flew to houston
  filter(flights, dest %in% c("IAH", "HOU"))

# 3. operated by united
  filter(flights, carrier %in% c("AA", "DL", "UA"))
  
# 4. arrived more than 2 hours late 
  filter(flights, arr_delay >120 & dep_delay <= 0)

# 5. delayed at least an hour
  filter(flights, dep_delay >= 60 & arr_delay < 30)
  
# 6. departed between midnight and 6am
  filter(flights, dep_time == 2400 | dep_time <= 0600)
  
# 7. missing dep_time
  filter(flights, is.na(dep_time))


  
    