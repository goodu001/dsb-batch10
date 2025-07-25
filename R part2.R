library(tidyverse)
library(glue)
library(RSQLite)

## glue

name <- "DP"
age <- 38
glue("Hello I AM {name} and my age is {age}")

## connect sqlite database
## create connection
con <- dbConnect(SQLite(), "chinook.db")

## how many table
dbListTables(con)

## col name in table

dbListObjects(con)
dbListFields(con, "customers")

## get data from a  table

usa_customers <- dbGetQuery(con, "
           SELECT
            FirstName, 
            LastName, 
            Country, 
            Email
          FROM customers
          WHERE Country = 'USA'
                 ")

## write table into a database
branches <- data.frame(
  branche_id = 1:3, 
  branche_name = c("BKK", "LON", "ICN")
)

dbWriteTable(con, "branches", branches)


## remove table
dbRemoveTable(con, "branches")

## disconnect

dbDisconnect(con)

## create a new database

## con <- dbConnect(SQLite(), "school.db")

## dbListTables(con)

## dbWriteTable(con, "students", 
             ## data.frame(id = 1:2, 
                        ## names = c("DP", "Joe")))

## dbGetQuery(con, "SELECT names FROM students") 

con2 <- dbConnect(SQLite(), "school2.db")
dbListTables(con2)

dbWriteTable(con2, "students", 
             data.frame(id = 1:2, 
                        names = c("DP", "Joe")))
dbGetQuery(con2, "SELECT names FROM students")
dbDisconnect(con2)


## HW3 create a new restaurant.db