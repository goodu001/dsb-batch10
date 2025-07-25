library(tidyverse)

hist(mtcars$mpg)
hist(mtcars$hp)
mean(mtcars$hp)
median(mtcars$hp)

str(mtcars)
mtcars$am <- factor(mtcars$am,
                    levels = c(0,1),
                    labels = c("auto", "manual"))
## bar plot - 1 qualitative variable
table(mtcars$am)
barplot(table(mtcars$am))

## box plot
boxplot(mtcars$hp)
fivenum(mtcars$hp)

min(mtcars$hp)
quantile(mtcars$hp, probs = c(.25, .5, .75))
max(mtcars$hp)

## whisker calculation

Q3 <- quantile(mtcars$hp, probs = .75)
Q1 <- quantile(mtcars$hp, probs = .25)
IQR_HP <- Q3-Q1

Q3 + 1.5*IQR_HP
Q1 - 1.5*IQR_HP

boxplot.stats(mtcars$hp, coef = 1.5)

## filter out outliers

mtcars_no_out <- mtcars %>%
  filter(hp < 335)

boxplot(mtcars_no_out$hp)

## boxplot 2 variables
## qualitative X quantitative
data(mtcars)

mtcars$am <- factor(mtcars$am,
                    levels = c(0,1),
                    labels = c("auto", "manual"))

boxplot(mpg ~ am, data = mtcars,
        col = c("gold", "salmon"))

## sactter plot
## 2 X quantitative
plot(mtcars$hp, mtcars$mpg, pch = 17,
     col = "red",
     main = "Relationship between HP and MPG",
     xlab = "horse power",
     ylab = "Mile per Gallon"
     )


cor(mtcars$hp, mtcars$mpg)
lm(mpg ~ hp, data = mtcars)







