data1 = read.table("scatter1.txt", header=T)
attach(data1)

names(data1)


plot(xv,ys,col="red")


data1 <- read.table("C:\\Users\\karlt\\Documents\\therbook (1)\\scatter1.txt",header=T)

#attach 
attach(data1)
names(data1)


#convert for easier follow along
x1 <- xv
y1 <- ys


plot(x1, y1, col = "red")


plot(x1,y1,col="red",xlab="Explanatory variable",ylab="Response
variable")

abline(lm(y1~x1))

data2 <- read.table("C:\\Users\\karlt\\Documents\\therbook (1)\\scatter2.txt",header=T)
attach(data2)
names(data2)

x2 = xv2
y2 = ys2

points(x2,y2,col="blue",pch=16)

abline(lm(y2~x2))

plot(c(x1,x2),c(y1,y2),xlab="Explanatory variable",
     ylab="Response variable",type="n")
points(x1,y1,col="red")
points(x2,y2,col="blue",pch=16)

abline(lm(y1~x1))
abline(lm(y2~x2))

range(c(x1,x2))
range(c(y1,y2))

plot(c(x1,x2),c(y1,y2),xlim=c(0,100),ylim=c(0,70),
     xlab="Explanatory variable",ylab="Response variable",type="n")
points(x1,y1,col="red")
points(x2,y2,col="blue",pch=16)
abline(lm(y1~x1))
abline(lm(y2~x2))

legend(locator(1),c("treatment","control"),pch=c(1,16), col=c("red","blue"))

#I'm not sure what ?locator means in this context
#the output for ?locator is the R documentation for locator graphics 

#location of the top left corner of the legend is 
#8.652767
#62.5642

#description of the parameters in line 50: 
# legend 
#   adds legends to plots 
#   locator can be used instead of x and y arguments
# 
# "treatment" & "Control"
#   the names for the top and bottom text in the legend
# 
# pch
#   part of points, draws a sequence of points at a certain coordinate
#   1 is an open circle 
#   16 is a closed circle
#   red and blue are the colors of the circles 




