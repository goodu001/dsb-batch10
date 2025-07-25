## load library
library(tidyverse)
library(glue)
library(RSQLite)
library(readxl)
library(jsonlite)
library(dplyr)
## read files into R

df1 <- read_csv("https://raw.githubusercontent.com/toyeiei/data-traninig/main/student_01.csv")

df2 <- read_csv2("https://raw.githubusercontent.com/toyeiei/data-traninig/main/student_02.csv")

df3 <- read_delim("https://raw.githubusercontent.com/toyeiei/data-traninig/main/student_03.txt", "|")

df4 <- read_tsv("https://raw.githubusercontent.com/toyeiei/data-traninig/main/student_04.tsv")

df5 <- read_excel("student_05.xlsx", 1)


## json

my_profile <- fromJSON("may_profile.json")

## read json as dataframe
ex <- fromJSON("ex_df.json")

## data transformation
## 1. select columns
## 2. filter row
## 3. arrange
## 4. mutate (create new columns)
## 5. summarise

## how to select columns

select(mtcars, hp, wt, am) ## subset by name

select(mtcars, 1:5, 10) ## subset by position

select(mtcars, contains("a")) ## subset by condition

## data transformation pipeline

mtcars %>%
  select( hp, wt, am) |>
  ##filter( grepl("^M.+", model) & hp >= 180 )
  arrange(am, hp)

## mutate and summarise

mtcars |>
  filter(hp < 100 ) |>
  select(am, hp) |>
  arrange(am)|>
  mutate(am = ifelse( am == 0, "Auto", "Manual"))

mtcars |>
  filter(wt <= 5)|>
  summarise(mean_hp = mean(hp),
            sum_hp = sum(hp),
            median_hp = median(hp),
            sd_hp = sd(hp))

## data |>
  ## select() |>
  ## filter() |>
  ## arrange() |>
  ## mutate() |>
  ## summarise() 
