#first page: 25


#
#Environment commands pg25
#
  #set working directory
  setwd("C:/Users/ksuits/Documents/R/testProject") 

  #library help command
  library(help = "datasets") 

  #number of data sets
  data() 

  #loads into memory
  data("mtcars")
  
  #print first 6 rows of dataset
  head(mtcars,6)

  #return number of rows in dataset
  nrows("mtcars") #couldn't find any function with this name
  #ncol()
  nrow("mtcars") "NULL"
  NROW("mtcars") #[1] 1

  #return columns
  nbcol("mtcars") #couldn't find function nbcol
  ncol("mtcars")
  NCOL("mtcars") #[1] 1

  #learn more about the dataset or any function
  ?mtcars

#  
#Useful Data Commands pg26
#
#Control L clears console 
#calculations work like a calculator
2+2
1*4
4^2
sqrt(4)

#c() joins together
y = c(1,2,3,4,5,6,7,8,9,10)
print(y) # [1] 1...10

#Functions
mean(y) #[1] 5.5
median(y)
range(y)
lowest(y) #error could not find function
min(y)
max(y)

#
#Built-in Constants (pg 32)
#

#LETTERS
LETTERS #A-Z
letters #a-z
pi #3.14...
month.name
month.abb #months abbreviated

pi <- 56
pi #changed to 56


########## R Arithmetic Operators pg 33 ##########
#Mathematical operations
x <- 5
y <- 16
x + y
x - y
x*y
x/y
y%%x
x%%y
y%/%x
x%/%y
y^x

########## R Relational Operators pg34 ##########
# logical comparisons
x <- 5
y <- 16
x<y 
x>y 
x<=5
y>=20
y==16
x != 5
x != 10

########## Operations on Vectors pg 35 ##########
#Concatenate vectors
x <- c(2,8,3)
y <- c(6,4,1)
x + y
x>y
x-1

########## R Assignment Operators pg 37 ########## 
x <- 5
x # 5
x = 9
x # 9
10 -> x
x #10

########## R Operator Precedence and Associativity pg38 ########## 
#*>+
2 + 6 * 5
#parenthesis
(2 + 6) * 5

########## Operator Associativity pg 39 ########## 
3 / 4/ 5 #0.15
3 / (4 / 5) #3.75

########## Assignment Variables pg 42 ########## 
# = vs ==
x = 10
x == 10 #is it 10?

########## %in% and which pg 43 ########## 
#in compares
stock <- c("car","van")
requests <- c("truck","suv","van","sports","car","waggon","car")

#which
which(requests %in% stock)

#requests
requests [which(requests %in% stock)]

#stock
stock[match(requests,stock)][!is.na(match(requests,stock))]

#more complicated which
which(sapply(requests, "%in%", stock))


########## If Statements pg 44 ##########
x <- 5
if(x > 0){
print("positive number")
}

########## Else Statements pg 45 ########## 
x <- -5
if(x > 0){
  print("non-negative number")
} else {
  print("negative number")
}

########## Syntax of ifelse() function pg 46 ########## 
a = c(5,6,2,9)
ifelse(a %% 2 == 0, "even","odd")

########## If...else Ladder pg 47 ########## 
x <- 0
if (x < 0) {
  print("negative number")
} else if (x > 0 ) {
  print("positive number")
} else
  print("zero")

########## for loop ########## 
x <- c(2,5,3,9,8,11,6)
count <- 0
for (val in x) {
  if(val %% 2 == 0) count = count + 1
}
print(count) #3

########## While Loop pg 51 ########## 
i <- 1
while (i < 6 ){
  print(i)
  i = i + 1
}

########## Next Statement pg 53 ########## 
x <- 1:5
for (val in x) {
  if (val ==3){
    next
  }
  print(val)
}

########## Break Statement pg54 ########## 
x <- 1:5
for(val in x){
  if (val == 3){
    break
  }
  print(val)
}

########## Repeat Loop ########## 
x <- 1
repeat {
  print(x)
  x = x+1
  if (x == 6){
    break
  }
}

########## Example of a Function pg 58 ########## 
pow <- function(x,y) {
  result <- x^y
  print(paste(x,"raised to the power", "is", result))
}

########## How to call a function ########## 
pow <- function(x,y) {
  result <- x^y
  print(paste(x,"raised to the power", "is", result))
}
pow(3,3) #9
pow(2,8)

########## Named Arguments ########## 
pow(8,2)
pow(x = 8, y = 2)
pow(y = 2, x = 8) #still 64
pow(x=8,2)
pow(2, x=8)

########## Default Values for Arguments ##########
pow <- function(x, y = 2) {
  result <- x^y
  print(paste(x,"raised to the power", y, "is",result))
}

pow(3)
pow(3,1)

########## R Return Value from Function ##########
check <- function(x) {
  if (x > 0) {
    result <- "Positive"
  }
  else if (x<0){
    result <- "Negative"
  }
  else {
    result <- "zero"
  }
  return (result)
}
check(1)
check(-10)
check(0)

########## Multiple Returns ##########
multi_return <- function() {
  my_list <- list("color" = "red", "size" = 20, "shape" = "round")
  return(my_list)
}
a <- multi_return()
a$color
a$size
a$shape

########## Environment and Scope ##########
a = 2
b = 5
f = function(x) x = 0
ls()


environment()<environment: R_GlobalEnv>
.GlobalEnv

########## Cascading of Environments ########## 
f = function(f_x){
g = function(g_x){
print("Inside g")
print(environment())
print(ls())
}
g(5)
print("inside f")
print(environment())
print(ls())
}

f(6)
environment()
ls()

########## R Programming Scope ########## 
outer_func = function(){
  a = 20
inner_func = function(){
  a = 30
  print(a)
}
inner_func()
print(a)
}

a = 10
outer_func()
print(a)

########## Accessing Global Variables ########## 
outer_func = function(){
  inner_func = function(){
    a <<- 30 #modified setting
    print(a)
  }
  inner_func()
  print(a)
}

outer_func()
print(a)

########## R Recursive Function ########## 
recursive.factorial <- function(x){
  if (x== 0) return(1)
  else return(x* recursive.factorial(x-1))
}

recursive.factorial(0)
recursive.factorial(5)
recursive.factorial(7)

########## R Infix Operator ########## 
5 + 3
'+'(5,3)
'-'(5,3)
5*3-1
'-'('*'(5,3),1)

#user Defined Infix Operator
'%divisible%' <- function(x,y)
{
  if(x%%y ==0) return(TRUE)
  else return(FALSE)
}
10 %divisible% 3
'%divisible%'(10,5)

########## switch function ########## 
switch(2,"red","green","blue")
switch(1,"red","green","blue")

x <- switch(4,"red","green","blue")
x

x <- switch(0,"red","green","blue")
x


########## R Vector ########## 
x <- c(1,5,4,9,0)
typeof(x)
length(x)
x <- c(1, 5.4, TRUE, "hello")
typeof(x)

#another example
x <- 1:7; x
y <- 2:-2; y 

#seq function
seq(1, 3, by=0.2)
seq(1,5,length.out=4)

########## Access Elements of vectors ########## 
x <- c(0,2,4,6,8,10)
x
x[3]
x[c(2,4)]
x[-1]
x[c(2, -4)]
x[c(2.4, 3.54)]

########## character Vector Index ########## 
x <- c("first"=3, "second"=0, "third"=9)
names(x)
x["second"]
x[c("first","third")]

########## modify vector in R ########## 
x <- c(-3, -2, -1, 0, 1, 2)
x
x[2] <- 0;x
x[x<0] <- 5;x
x<- x[1:4]; x

#delete vector
x <- c(-3:2)
x
x <- NULL
x
x[4] #all NULL

########## Matrix in R ########## 
matrix(1:9, nrow = 3, ncol = 3)
matrix(1:9, nrow = 3)
matrix(1:9, nrow=3, byrow=TRUE)

x <- matrix(1:9, nrow = 3, dimnames = list(c("X","Y","Z"), c("A","B", "C")))
x #display matrix

#accessed or chnaged with two helpful functions 
colnames(x)
rownames(x)
colnames(x) <- c("c1","c2","c3")
rownames(x) <- c("R1","R2","R3")
x

#another way 
cbind(c(1,2,3),c(4,5,6))

rbind(c(1,2,3),c(4,5,6))

#from a vector

x <- c(1,2,3,4,5,6)
x
class(x)
dim(x) <- c(2,3)
x
class(x)

########## Access elements of a matrix ########## 
x <- matrix(1:9, nrow = 3, ncol = 3)
x[c(2,1),]

x[,]
x[-1,]

x[c(1,2),c(2,3)]

x[1,]
class(x[1,])

drop = FALSE
x[1,,drop=FALSE]
class(x[1,,drop=FALSE])

########## indexing matrix ########## 
x <- matrix(1:9, nrow = 3, ncol = 3)
x
x[1:4]
x[c(3,5,7)]

########## logical vector as index ########## 
x <- matrix(1:9, nrow = 3, ncol = 3)
x
x[c(TRUE,FALSE,TRUE),c(TRUE,TRUE,FALSE)]
x[c(TRUE,FALSE),c(2,3)]

########## single logical vector ########## 
x[c(TRUE, FALSE)]

x[x>5]
x[x%%2 ==0]

########## character vector as matrix ########## 
x <- matrix(1:9, nrow = 3, ncol = 3)
x
colnames(x) <- c("A","B","C")
x
x[,"A"]
x[TRUE,c("A","C")]
x[2:3,c("A","C")]

########## Modify a matrix in R ########## 
x <- matrix(1:9, nrow = 3, ncol = 3)
x
x[2,2] <- 10;x
x[x<5] <- 0; x
t(x) #transpose

#dim function
x <- matrix(1:6, nrow = 2, ncol = 3)
x
dim(x) <- c(3,2); x
dim(x) <- c(1,6);x

########## R Lists ########## 
#create a lsit
x <- list("a" = 2.5, "b" = TRUE, "c" = 1:3)
x
typeof(x)
length(x)

str(x)
x <- list(2.5, TRUE, 1:3)
x

########## Access components of list ########## 
x <- list("name" = "john", "age" = 19, "speaks" = "english")
x
x[c(1:2)]
x[-2]
x[c(T,F,F)]

#alternative to [[
x$name
x$a
x[["a"]]
x$speaks[1]
x[["speaks"]][2]

########## modify a list ########## 
x[["name"]] <- "Clair"; x

########## add components to a lsit ########## 
x[["married"]] <- FALSE
x

########## Delete componenets ########## 
x[["age"]] <- NULL
str(x)
x$married <- NULL
x

########## create a date frame in R ########## 
