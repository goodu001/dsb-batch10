install.packages("glue")
library(glue)

pizza_df <- data.frame(pizza_id = 1:3, pizza_menu = c("Peperoni", "Ham and sausage", "Hawaiilian"), pizza_price = c(24, 33, 27))
drink_df <- data.frame(drink_id = 1:3, drink_menu = c("Coke", "Water", "Coffee"), drink_price = c(15, 10, 20))
wel <- "yes"

## chat bot func.
pizza_shop <- function() {
  print("Welcome to Mewo Mew Pizza!")
  
  welcome <- readline("How can i help you?")
  if(tolower(welcome == wel)){
   
    print("Select your pizza")
    print(pizza_df)
    select_pizza <- readline("Pls select pizza")
  
    print("Select your drink")
    print(drink_df)
    select_drink <- readline("Select your drink")
    
    if(select_pizza %in% pizza_df$pizza_id) {
      price_z <- pizza_df[which(pizza_df$pizza_id == select_pizza),"price"]
    }
    if(select_drink %in% drink_df$drink_id) {
      price_d <- drink_df[which(drink_df$drink_id == select_drink),"price"]
    } 
    print(paste0("The total price is ", price_z + price_d, " $"))
  } else {
    print("Thank for your serving")
  }
}

pizza_shop ()