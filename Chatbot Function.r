# Dataframes for Menus and Prices (as you had)
pizza_df <- data.frame(pizza_id = 1:3, pizza_menu = c("Peperoni", "Ham and sausage", "Hawaiilian"), pizza_price = c(24, 33, 27))
drink_df <- data.frame(drink_id = 1:3, drink_menu = c("Coke", "Water", "Coffee"), drink_price = c(15, 10, 20))

# Chatbot Function
pizza_order <- function() {
  print("Welcome to Channa7 Pizza!")
  total_price <- 0 
  order_items <- list(pizza = NULL, drink = NULL)
  
  # Pizza Ordering
  repeat {  
    pizza_or <- readline("Do you want to order pizza? (Yes/No): ")
    if (tolower(pizza_or) %in% c("yes", "y")) {
      # Show pizza options with formatted prices
      pizza_options <- paste(pizza_df$pizza_id, ". ", pizza_df$pizza_menu, " - $", pizza_df$pizza_price, sep = "")
      print("Please select your pizza:")
      cat(pizza_options, sep = "\n")  # Display options neatly
      
      repeat { 
        pizza_or2 <- readline("Please choose pizza ID (1-3): ")
        pizza_or2 <- as.integer(pizza_or2)
        if (pizza_or2 %in% pizza_df$pizza_id) {
          quantity <- readline("How many of this pizza would you like? ")
          quantity <- as.integer(quantity)
          
          # Add to order list
          order_items$pizza <- c(order_items$pizza, rep(pizza_df$pizza_menu[pizza_df$pizza_id == pizza_or2], quantity))
          total_price <- total_price + pizza_df$pizza_price[pizza_df$pizza_id == pizza_or2] * quantity
          
          break
        } else {
          print("Invalid pizza ID. Please enter a number between 1 and 3.")
        }
      }
      
      another_pizza <- readline("Do you want another pizza? (Yes/No): ")
      if (tolower(another_pizza) %in% c("no", "n")) {
        break
      } 
    } else if (tolower(pizza_or) %in% c("no", "n")) {
      break
    } else {
      print("Invalid input. Please enter Yes or No.")
    }
  }
  
  # Drink Ordering (similar to Pizza ordering, with formatted prices)
  repeat {
    drink_or <- readline("Do you want to order a drink? (Yes/No): ")
    if (tolower(drink_or) %in% c("yes", "y")) {
      # Show drink options with formatted prices
      drink_options <- paste(drink_df$drink_id, ". ", drink_df$drink_menu, " - $", drink_df$drink_price, sep = "")
      print("Please select your drink:")
      cat(drink_options, sep = "\n") 
      
      repeat {  
        drink_or2 <- readline("Please choose drink ID (1-3): ")
        drink_or2 <- as.integer(drink_or2)
        if (drink_or2 %in% drink_df$drink_id) {
          quantity <- readline("How many of this drink would you like? ")
          quantity <- as.integer(quantity)
          
          # Add to order list
          order_items$drink <- c(order_items$drink, rep(drink_df$drink_menu[drink_df$drink_id == drink_or2], quantity))
          total_price <- total_price + drink_df$drink_price[drink_df$drink_id == drink_or2] * quantity
          
          break
        } else {
          print("Invalid drink ID. Please enter a number between 1 and 3.")
        }
      }
      another_drink <- readline("Do you want another drink? (Yes/No): ")
      if (tolower(another_drink) %in% c("no", "n")) {
        break
      } 
    } else if (tolower(drink_or) %in% c("no", "n")) {
      break
    } else {
      print("Invalid input. Please enter Yes or No.")
    }
  }
  
  # Price Summary
  if (total_price > 0) {
    print("Your order:")
    print(order_items) 
    print(paste("Thank you for your order! Your total is: $", total_price, sep = "")) 
  } else {
    print("Thank you for visiting Channa7 Pizza!")
  }
}

# Start Chatbot
pizza_order()