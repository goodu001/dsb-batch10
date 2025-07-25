## HOMEWORK DATA TRANSFORM
## dplyr 5 query
library(tidyverse)

view(head(flights,100))
view(airlines)
view(planes)
view(airports)

## less than 100 miles routes
flights %>%
  inner_join(airlines, by = "carrier") %>%
  select(carrier, name, origin, dest, distance) %>%
  group_by(carrier, name, origin, dest) %>%
  filter(distance <= 100) %>%
  summarise(average_distance = mean(distance)) %>%
  arrange(average_distance)

## Top 10 air time flights
flights %>%
  inner_join(airlines, by = "carrier") %>%
  select(carrier, name, origin, dest, air_time) %>%
  group_by(carrier, name, origin, dest) %>%
  summarise(average_air_time = mean(air_time)) %>%
  arrange(desc(average_air_time)) %>%
  head(10)

## Arrival delay label (minutes)
flights %>%
  select(time_hour, flight, carrier, origin, dest, arr_delay) %>%
  mutate(arr_delay_label = ifelse(arr_delay == 0, "on time", ifelse(arr_delay < 0, "early", "delay")))

## 3 months with the most frequent flight arrival delays
flights %>%
  select(month, arr_delay) %>%
  mutate(arr_delay_label = ifelse(arr_delay == 0, "on time", ifelse(arr_delay < 0, "early", "delay"))) %>%
  group_by(month) %>%
  filter(arr_delay_label == "delay") %>%
  summarize(total_delays = n()) %>%
  arrange(desc(total_delays)) %>%
  top_n(3)

## Total flight of each carrier
flights %>%
  inner_join(airlines, by = "carrier") %>%
  select(carrier, name) %>%
  group_by(carrier, name) %>%
  summarize(total_flight = n()) %>%
  arrange(desc(total_flight))