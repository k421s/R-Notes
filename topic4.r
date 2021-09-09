#Homework Week 4 
#Karlton Suits

#p7, p12, p15

##########
#p7
##########

##1. relationship betewen cty and hwy
### There is a positive linear relationship  between cty and hwy. 

##concerns about drawing conclusions
### theres not much else you can draw from the graph besides hwy and mpg are consistently high or low. 

##2. ggplot(mpg,aes(model, manufacturer))+geom point()
### - it plots mpg with manufactuer and model. 
### - theres no apparent structure to the the models and manufacturers
### - some of the manufacturers are listed more than once in the data
### - it doesn't seem like any of the models have more than one manufacturer 

### using geom_bar() or facets might be more useful in this scenario or using a color fill option

df <- mpg %>% 
  transmute("man_mod" = paste(manufacturer, model, sep = " "))


ggplot(df, aes(man_mod)) +
  geom_bar() + 
  coord_flip()


##3. Describe the Data, aesthetics mappings and layers 
#ggplot(mpg, aes(cty, hwy)) + geom point()
## data: mpg 
## aesthetics: x is mapped to city mpg, and y to hwy mpg
## Default layers

# >ggplot(diamonds, aes(carat, price)) + geom point()
#data: diamonds, 
#aesthetic: carat number for x and price for y
#default layers

# >ggplot(economics, aes(date, unemploy)) + geom line()
#data: economics, 
#aesthetics: date to unemployment as a line plot

# >ggplot(mpg, aes(cty)) + geom histogram()
#data: mpg
#aes: city mpg mapped to a histogram





########
#p12
########
#1.
## - drive train is related to fuel economy by
## - front wheel is the most efficient around 18-20
## - rear wheel is lowest around 12-15
## - four wheel is slightly higher than rear wheel at 13-16


ggplot(mpg, aes(drv, cty)) + 
  geom_boxplot() +
  scale_x_discrete(limits = c("f", "r", "4"),
                   labels = c("Front wheel", "Rear wheel", "Four wheel"))



#violin plot I found in some examples
ggplot(mpg, aes(drv, cty)) + 
  geom_violin() +
  scale_x_discrete(limits = c("f", "r", "4"),
                   labels = c("Front wheel", "Rear wheel", "Four wheel"))



# Drive Train related to engine size and class
## - compacts, subcompacts, midsizes, and minivans tend to have the smallest displacement, suv, pickup, 2seaters tend to have the largest

## - subcompacts and suvs tend to be rear wheel


ggplot(mpg, aes(reorder(class, displ, FUN = median), displ, colour = drv)) + 
  geom_jitter(width = 0.5, height = 0)





###########
#p15 facets
###########

#1. 
#1.(a) continuous variable like hwy? 
## it wokrs but it might be hard to read  with too many levels

ggplot(mpg, aes(displ, cty)) + 
  geom_point() +
  facet_wrap(~ hwy)

#1. (b) solution that's easier to read with cyl
ggplot(mpg, aes(displ, cty)) + 
  geom_point() +
  geom_smooth(method = "lm") +
  facet_wrap(~ cyl)

##the key difference is the number of charts 


#2.
## 2(a). three way relationshipo 
### - relationship differs by cylinder number
### - no relationship with 5 cylinder by cyt and disp
### - 4 & 8 cylinder negative relationship 
### - positive for 8 cylinders

## 2(b).  how does facetting by number of cylinders change your assessment? 
### usually higher number of cylinders is less efficient than smaller number. this is usually consistent with displacement size 

#3. facet wrap() describe rows and columns # in output
## - nrow, ncol changes the number of rows and columns 

#4. Scales argument for facet_wrap()
### - Scales argument controls the fixed or free or free in one dimension 
### - scales changes if each facet has a fixed or varying scale 
### - free scales make it easier to see patterns within each panel but make it harder to compare. 

