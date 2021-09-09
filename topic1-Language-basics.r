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

#starting from page 105

x <- data.frame("SN" = 1:2, "Age" = c(21,15), "Name" = c("John","Dora"))
str(x)    # structure of x
 


##check if it's a frame or not 

class(x)


x <- data.frame("SN" = 1:2, "Age" = c(21,15), "Name" = c("John","Dora"))
str(x)    # structure of x

x <- data.frame("SN" = 1:2, "Age" = c(21,15), "Name" = c("John", "Dora"), stringsAsFactors = FALSE)
str(x)    # now the third column is a character vector


###accessing a matrix
str(trees)

head(trees,n=3)


#modifying a data frame
x
x[1,"Age"] <- 20; x

#adding components
rbind(x,list(1,16,"Paul"))


#deleting component
x$State <- NULL
x

x <- x[-1,]
x


###R Factors
x <- factor(c("single", "married", "married", "single")); 
x

x <- factor(c("single", "married", "married", "single"), levels = c("single", "married", "divorced"));
x

x <- factor(c("single","married","married","single"))
str(x)

#accessing components of a factor
x
x[3] 

x[c(2, 4)] # access 2nd and 4th element
x[-1] # access all but 1st element
x[c(TRUE, FALSE, FALSE, TRUE)] # using logical vector

##modifying
x <- factor(c("single","married","married","single"))

x[2] <- "divorced" # modify second element; x #errors

x[3] <- "widowed" # cannot assign values outside level #errors

x


#workaround
levels(x) <- c(levels(x), "widowed")    # add new level
x[3] <- "widowed"
x


#Create an s3 class

# create a list with required components
s <- list(name = "John", age = 21, GPA = 3.5)
# name the class appropriately
class(s) <- "student"
s

#s4 class
setClass("student", slots=list(name="character", age="numeric", GPA="numeric"))


#s3 using constructors
# a constructor function for the "student" class
student <- function(n,a,g) {
  # we can add our own integrity checks
  if(g>4 || g<0)  stop("GPA must be between 0 and 4")
  value <- list(name = n, age = a, GPA = g)
  # class can be set using class() or attr() function
  attr(value, "class") <- "student"
  value
}

s <- student("Paul", 26, 3.7)
s

s <- student("Paul", 26, 5)
#error above

s <- student("Paul", 26, 2.5)
#maintain
s$GPA <- 5


#methods and generic functions
#methods print
s
methods(print)


#default class
methods(class="default")


#write own methods
print.student <- function(obj) {
  cat(obj$name, "\n")
  cat(obj$age, "years old\n")
  cat("GPA:", obj$GPA, "\n")
}

s

#removing methods restores
unclass(s)

#writing your own generic function
print
plot

#examle
grade <- function(obj) {
  UseMethod("grade")
}

#implement the default method

grade.default <- function(obj) {
  cat("This is a generic function\n")
}

#method for class student
grade.student <- function(obj) {
  cat("Your grade is", obj$GPA, "\n")
}

#sample run
grades(s)


#s4 continued
s <- new("student",name="John", age=21, GPA=3.5)
s

isS4(s)

student <- setClass("student", slots=list(name="character", age="numeric", GPA="numeric"))
student

#example 3

student(name="John", age=21, GPA=3.5)


#modify a slot
s@name
s@GPA
s@age

#modify a slot directly 
s@GPA <- 3.7
s

#using the slot function
slot(s,"name")
slot(s,"name") <- "Paul"
s

#example 5
isS4(print)
isS4(show)

#example 6
showMethods(show)


#write your own method
setMethod("show",
          "student",
          function(object) {
            cat(object@name, "\n")
            cat(object@age, "years old\n")
            cat("GPA:", object@GPA, "\n")
          }
)

#write out the object
s <- new("student",name="John", age=21, GPA=3.5)
s


#### create a reference object in R

##environmental errors ??
setRefClass("student")

setRefClass("student", fields = list(name = "character", age = "numeric", GPA = "numeric"))


student <- setRefClass("student",
                       fields = list(name = "string", age = "numeric", GPA = "numeric"))

a <- student()
a <- student(name = "karl", age = 9, 3.5)

#Error in initialize(value, ...) : 
#invalid names for slots of class “student”: name, age, GPA

#access and modify fields
s$name
s$age
s$GPA

s$name <- "Paul"
s


#warning note
a <- list("x" = 1, "y" = 2)
b <- a
b$y = 3
a
b


#not the case with reference objects
a <- student(name = "John", age = 21, GPA = 3.5)
b <- a
b$name <- "Paul"
a
b


#unwanted change
a <- student(name = "John", age = 21, GPA = 3.5)
b <- a$copy()


student <- setRefClass("student",
                       fields = list(name = "character", age = "numeric", GPA = "numeric"),
                       methods = list(
                         inc_age = function(x) {
                           age <<- age + x
                         },
                         dec_age = function(x) {
                           age <<- age - x
                         }
                       )
)
s <- student(name = "John", age = 21, GPA = 3.5)
s$inc_age(5)
s$age
s$dec_age(10)
s$age


###inheritance in R3
student <- function(n,a,g) {
  value <- list(name=n, age=a, GPA=g)
  attr(value, "class") <- "student"
  value
}
print.student <- function(obj) {
  cat(obj$name, "\n")
  cat(obj$age, "years old\n")
  cat("GPA:", obj$GPA, "\n")
}

# create a list
s <- list(name="John", age=21, GPA=3.5, country="France")
# make it of the class InternationalStudent which is derived from the class student
class(s) <- c("InternationalStudent","student")
# print it out
s

print.InternationalStudent <- function(obj) {
  cat(obj$name, "is from", obj$country, "\n")
}
s


#check for inheritance
inherits(s,"student")
is(s,"student")

#inheritence in s4
# define a class called student
setClass("student",
         slots=list(name="character", age="numeric", GPA="numeric")
)
# define class method for the show() generic function
setMethod("show",
          "student",
          function(object) {
            cat(object@name, "\n")
            cat(object@age, "years old\n")
            cat("GPA:", object@GPA, "\n")
          }
)

# inherit from student
setClass("InternationalStudent",
         slots=list(country="character"),
         contains="student"
)

s <- new("InternationalStudent",name="John", age=21, GPA=3.5, country="France")
show(s)

#inheritance from reference classes
student <- setRefClass("student",
                       fields=list(name="character", age="numeric", GPA="numeric"),
                       methods=list(
                         inc_age = function(x) {
                           age <<- age + x
                         },
                         dec_age = function(x) {
                           age <<- age - x
                         }
                       )
)
InternationalStudent <- setRefClass("InternationalStudent",
                                    fields=list(country="character"),
                                    contains="student",
                                    methods=list(
                                      dec_age = function(x) {
                                        if((age - x)<0)  stop("Age cannot be negative")
                                        age <<- age - x
                                      }
                                    )
)


s <- InternationalStudent(name="John", age=21, GPA=3.5, country="France")
s$dec_age(5)
s$age
s$dec_age(20)
s$age

#r bar plot


max.temp <- c(22, 27, 26, 24, 23, 26, 28)
barplot(max.temp)


#another bar plot with color
barplot(max.temp,
        main = "Maximum Temperatures in a Week",
        xlab = "Degree Celsius",
        ylab = "Day",
        names.arg = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"),
        col = "darkred",
        horiz = TRUE)


#plotting categorial data
age <- c(17,18,18,17,18,19,18,16,18,18)
table(age)
age
barplot(table(age), main="Age Count of 10 Students",
        xlab="Age", ylab="Count", border="red", col="blue",
        density=10
)


#higher dimensional tables
head(Titanic, 100)
data("Titanic")
force(Titanic)

margin.table(Titanic,1)
margin.table(Titanic,4)
margin.table(Titanic)

#data plot
barplot(titanic.data, main = "Survival of Each Class", xlab = "Class", col = c("red","green") )
legend("topleft", c("Not survived","Survived"), fill = c("red","green") )


#histograms
str(airquality)


#example 1
Temperature <- airquality$Temp
hist(Temperature)

#example 2
# histogram with added parameters
hist(Temperature,
     main="Maximum daily temperature at La Guardia Airport",
     xlab="Temperature in degrees Fahrenheit",
     xlim=c(50,100),
     col="darkmagenta",
     freq=FALSE
)

#return value 
h <- hist(Temperature)
h

#example 3
h <- hist(Temperature,ylim=c(0,40))
text(h$mids,h$counts,labels=h$counts, adj=c(0.5, -0.5))

#number of breaks
#example 4
hist(Temperature, breaks=4, main="With breaks=4")
hist(Temperature, breaks=20, main="With breaks=20")

#example 5
hist(Temperature,
     main="Maximum daily temperature at La Guardia Airport",
     xlab="Temperature in degrees Fahrenheit",
     xlim=c(50,100),
     col="chocolate",
     border="brown",
     breaks=c(55,60,70,75,80,100)
)


#r pie chart
#expenditure
#pie(expenditure)

pie(expenditure,
    labels=as.character(expenditure),
    main="Monthly Expenditure Breakdown",
    col=c("red","orange","yellow","blue","green"),
    border="brown",
    clockwise=TRUE
)


#box plots
str(airquality)

boxplot(airquality$Ozone)

boxplot(airquality$Ozone,
        main = "Mean ozone in parts per billion at
Roosevelt Island",
        xlab = "Parts Per Billion",
        ylab = "Ozone",
        col = "orange",
        border = "brown",
        horizontal = TRUE,
        notch = TRUE
)

#return value of box plots
b <- boxplot(airquality$Ozone)
b

#boxplot from formula
boxplot(Temp~Month,
        data=airquality,
        main="Different boxplots for
each month",
        xlab="Month Number",
        ylab="Degree Fahrenheit",
        col="orange",
        border="brown"
)

#stripchart 
#example 2
str(airquality)
stripchart(airquality$Ozone)

#using jitter
stripchart(airquality$Ozone,
           main="Mean ozone in parts per billion at Roosevelt Island",
           xlab="Parts Per Billion",
           ylab="Ozone",
           method="jitter",
           col="orange",
           pch=1
)

#multiple strip charts
# prepare the data
temp <- airquality$Temp
# gererate normal distribution with same mean and sd
tempNorm <- rnorm(200,mean=mean(temp, na.rm=TRUE), sd = sd(temp, na.rm=TRUE))
# make a list
x <- list("temp"=temp, "norm"=tempNorm)

stripchart(x,
           main="Multiple stripchart for comparision",
           xlab="Degree Fahrenheit",
           ylab="Temperature",
           method="jitter",
           col=c("orange","red"),
           pch=16
)


x <- seq(-pi,pi,0.1)
plot(x, sin(x))

#adding titles 
plot(x, sin(x),
     main="The Sine Function",
     ylab="sin(x)")



#plot using col
plot(x, sin(x),
     main="The Sine Function",
     ylab="sin(x)",
     type="l",
     col="blue")


#overlaying plots using legend() function
plot(x, sin(x),
     main="Overlaying Graphs",
     ylab="",
     type="l",
     col="blue")
lines(x,cos(x), col="red")
legend("topleft",
       c("sin(x)","cos(x)"),
       fill=c("blue","red")
)



#multiple plots
Temperature <- airquality$Temp
Ozone <- airquality$Ozone
par(mfrow=c(2,2))
hist(Temperature)
boxplot(Temperature, horizontal=TRUE)
hist(Ozone)
boxplot(Ozone, horizontal=TRUE)


par(mfcol = c(2, 2))

#saving an r plot
Temperature <- airquality$Temp
Temperature

#as jpeg
jpeg(file="saving_plot1.jpeg")
hist(Temperature, col="darkgreen")
dev.off()

#png
png(file="C:/Datamentor/R-tutorial/saving_plot2.png",
    width=600, height=350)
hist(Temperature, col="gold")
dev.off()

#bmp
bmp(file="saving_plot3.bmp",
    width=6, height=4, units="in", res=100)
hist(Temperature, col="steelblue")
dev.off()

#tiff
tiff(filename = "saving_plot3")

tiff(file="saving_plot3.tiff",
     width=6, height=4, units="in", res=100)
hist(Temperature, col="steelblue")
dev.off()


#r plot color
temp <- c(5,7,6,4,8)
barplot(temp, main="By default")
barplot(temp, col="coral", main="With coloring")

#hex value colors
barplot(temp, col="#c00000", main="#c00000")
barplot(temp, col="#AA4371", main="#AA4371")

#rgb
rgb(0, 1, 0)
rgb(0.3, 0.7, 0.9)
rgb(55,0,77, max=255)

#color cycling
barplot(temp, col=c("#FF0099","#CCFF00","#33FF00",
                    "#00FF66","#FF9900"), main="With 5 colors")
barplot(temp, col=c("#FF99FF","#0066FF","#00FF4D"), main="With 3 colors")

#color Palette
rainbow(5)

barplot(temp, col=rainbow(5), main="rainbow")
barplot(temp, col=heat.colors(5), main="heat.colors")
barplot(temp, col=terrain.colors(5), main="terrain.colors")
barplot(temp, col=topo.colors(5), main="topo.colors")

#r 3d plot
cone <- function(x, y){
  sqrt(x^2+y^2)
}
x <- y <- seq(-1, 1, length= 20)
z <- outer(x, y, cone)
persp(x, y, z)


#additional R concepts
y <- strptime("01/02/2014",format="%d/%m/%Y")
weekdays(y)
y$wday
