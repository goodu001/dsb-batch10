library(RSQLite)

con = dbConnect(SQLite(),"restaurant.db")

staffs1 <- data.frame(
  staff_id = 1:5,
  staff_name = c("John", "Jane", "Alex", "Chloe", "Liam"),
  staff_position = c("Manager", "Chef", "Chef","Waiter", "Waitress"),
  staff_salary = c(50000, 35000, 35000, 20000, 20000)
)

menus <- data.frame(
  menu_id = 1:7,
  menu_name = c("Pizza", "Burger", "Salad", "Pasta", "Sushi", "Steak", "Fried Chicken"),
  menu_price = c(49, 69, 89, 299, 499, 399, 60)
)

transactions1 <- data.frame(
  transaction_id = 1:7,
  transaction_date = c("2024-06-01", "2024-06-02", "2024-06-03", "2024-06-04", "2024-06-05", "2024-06-06", "2024-06-07"),
  menu_id = c(1, 5, 7, 6, 7, 2, 3),
  quantity = c(1, 1, 2, 1, 2, 1, 3)
)

dbWriteTable(con, "staffs1", staffs1)
dbWriteTable(con, "menus", menus)
dbWriteTable(con, "transactions1", transactions1)


dbGetQuery(con, "select * from staffs1")
dbGetQuery(con, "select * from menus")
dbGetQuery(con, "select * from transactions1")


dbGetQuery(con, "select
          tr.transaction_date,
          menus.menu_name,
          menus.menu_price
                  from menus
                  join transactions1 as tr on tr.menu_id = menus.menu_id
                  where transaction_date == '2024-06-06'"
           
)
