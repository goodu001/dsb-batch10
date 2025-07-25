library(tidyverse)
library(nycflights13)
library(dplyr)
write.csv(flights, "flights.csv")

read.csv(flights)

df <- read.csv("flights.csv")

df %>%
  select(1:5) %>%
  filter(month == 5)

df %>%
  count(carrier) %>%
  arrange(-n) %>%
  left_join(airlines)

df %>%
  filter(origin == "JFK")


df %>%
  select(carrier, flight, distance) %>%
  arrange(distance) %>%
  head(5)

df %>%
  select(carrier, flight, arr_delay) %>%
  arrange(arr_delay) %>%
  head(5)

  