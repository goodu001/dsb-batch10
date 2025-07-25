library(tidyverse)
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) +
  geom_point() +
  geom_smooth() +
  geom_rug()


ggplot(mtcars, aes(hp, mpg)) +
  geom_point(size = 3, col = "blue", alpha = 0.2)

ggplot(mtcars, aes(hp)) +
  geom_histogram(bins = 10, fill = "red", alpha = 0.5)

ggplot(mtcars, aes(hp)) +
  geom_boxplot()

p <- ggplot(mtcars, aes(hp))
p + geom_histogram(bins=10)
p + geom_density()
p + geom_boxplot()
p + geom_bar()


## box plot by group

diamonds %>%
  count(cut)

ggplot(diamonds, aes(cut)) +
  geom_bar(fill = "lightblue")

ggplot(diamonds, aes(cut, fill = color)) +
  geom_bar(position = "dodge")


## scatter plot

set.seed(52)
small_diamons <- sample_n(diamonds, 1000)

ggplot(small_diamons, aes(carat, price)) +
  geom_point() +
  geom_smooth()


## facet

ggplot(small_diamons, aes(carat, price)) +
  geom_point() +
  geom_smooth(method = "lm", col="lightblue") +
  facet_wrap(~color, ncol = 2) +
  theme_minimal() +
  labs(title = "Relationship between carat and price by color",
       x = "carat",
       y = "price USD",
       caption = "source : Diamons from ggplot2 package")
  
#### final example
ggplot(small_diamons, aes(carat, price, col=cut)) +
  geom_point(size=3, alpha = 0.3) +
  facet_wrap(~color, ncol=2) +
  theme_minimal() +
  geom_smooth()




















