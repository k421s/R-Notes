#hw slides 48, 49, 65, 70, 98

#slide 69
# Suppose IQ scores are normally distributed with mean 100 and standard deviation 15. 
# What is the 95th percentile of the distribution of IQ scores?

z
prob <- qnorm(0.95,mean=100,sd=15)
prob


# Generates 1000 independent and identically distrbuted
# normal random numbers (first line), plots their histogram
# (second line), and graphs the p. d. f. of the same normal
# distribution (third and forth lines). Assume the mean = 100
# and the sd = 15.

x <- rnorm(1000, mean = 100, sd = 15)
hist(x, freq = FALSE)
curve(dnorm(x, mean = 100, sd = 15), add = TRUE)

#70

means <- numeric(10000)
for (i in 1:10000)
{
  means[i] <- mean(runif(5)*10)
}
yHeight<- 1600
hist(means,ylim=c(0, yHeight),main="")
xbar<-mean(means)
xbar

Sdbar<-sd(means)
sbbar

seqFrom <- 0
seqTo <- 8 
segInc = 0.1
normheight = 5000

xv = seq(seqFrom, seqTo, segInc)
yv =  ppois(xv, lambda = 25)* normheight
lines(xv,yv)

window()

#ppois


#98

#1
pchisq(2.34,6)
#2
pchisq(15.34,9, lower.tail=FALSE)
#3
pchisq(6.66,17) + pchisq(27.34,17, lower.tail=FALSE)
#4
pchisq(25.41, 14) - pchisq(5.25,14)
#5
qchisq(0.0333,5)
#6
qchisq(0.125, 25, lower.tail=FALSE)
#7
qchisq(0.125,11)
qchisq(0.125,11, lower.tail=FALSE)
#8
qchisq(0.01665,23)
qchisq(0.01665,23,lower.tail=FALSE)


