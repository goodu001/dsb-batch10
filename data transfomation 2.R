## dplyr (part of tidyverse)
## select(), filter(), arrange(), mutate(), summarise()

library(tidyverse)

## dplyr + ggplot
## 1.select()
## 2.filter()
## 3.arrange()
## 4.mutate()
## 5.summarise()
## other function: count, distinct
## join table, bind_row, bind_col

## df <- tibble(mtcars)

df <- mtcars %>%
  rownames_to_column(var = "model") %>%
  tibble()

## random sample
set.seed(10)
df %>% 
  sample_n(3)

df %>%
  sample_frac(0.2)

df %>%
  select(model, am) %>%
  mutate(am = ifelse( am == 0, "Auto", "Manual")) %>%
  count(am) %>%
  mutate(pct = n/ sum(n))

## distinct
df %>%
  select(model, am) %>%
  mutate(am = ifelse( am == 0, "Auto", "Manual")) %>%
  distinct(model) %>%
  pull()


## join table

## SQL joins
## inner, left, right, full

## 1. inner_join(band_members, band_instruments, by = "name")

band_members %>%
  inner_join(band_instruments, by = "name")
## left
band_members %>%
  left_join(band_instruments, by = "name")
## right
band_members %>%
  right_join(band_instruments, by = "name")
## full outer join
band_members %>%
  full_join(band_instruments, by = "name") %>%
  drop_na()

## replace n/a
band_members %>%
  full_join(band_instruments, by = "name") %>%
  mutate(plays = replace_na(plays, "drum"),
         band =  replace_na(band, "aero smith"))

## union data (like SQL)
df1 <- data.frame(id=1:3,
                  name=c("DK", "John", "mary"))

df2 <- data.frame(id=3:5,
                  name=c("mary", "Anna", "Doh"))

df3 <- data.frame(id=6:8,
                  name= c("Kai", "Non", "Toto"))

df4 <- data.frame(id=9:11,
                  name= c("Satoshi", "Nana", "Mari"))

## bind row and remove dup
df1 %>%
  bind_rows(df2) %>%
  distinct() ## remove dup

## shortcut when we have multiple df

list_df <- list(df1,df2,df3,df4)

list_df %>%
  bind_rows() %>%
  distinct()

## join in case key names are not the same

band_members %>%
  rename(friend = name) %>%
  left_join(band_instruments, by = c("friend" = "name"))

## basic data visualization
## ggplot2 > gramma of graphic

qplot(mpg, data=mtcars, geom="histogram", bins=20)

qplot(mpg, data=mtcars, geom="density")

## scatter plot
qplot(x=hp, y=mpg, data=mtcars, geom = "point")


## ggplot
ggplot(data= mtcars,
       aes(x= hp, y=mpg)) +
  geom_point(col="red") +
  geom_smooth() +
  theme_dark()







