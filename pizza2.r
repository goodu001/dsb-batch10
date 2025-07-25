install.packages("glue")  # Make sure to install glue package if not already installed
library(glue)

# Define pizza and drink data frames
pizza_df <- data.frame(pizza_id = 1:3, pizza_menu = c("Pepperoni", "Ham and Sausage", "Hawaiian"), pizza_price = c(24, 33, 27))
drink_df <- data.frame(drink_id = 1:3, drink_menu = c("Coke", "Water", "Coffee"), drink_price = c(15, 10, 20))
wel <- "yes"

## Chat bot function
pizza_shop <- function() {
  print("Welcome to Mewo Mew Pizza!")
  
  welcome <- readline("How can I help you? ")  # Fixed the readline prompt
  if(tolower(welcome) == wel){  # Corrected the condition for welcome message
   
    print("Select your pizza:")
    print(pizza_df)
    select_pizza <- as.integer(readline("Please select pizza: "))  # Converted input to integer
  
    print("Select your drink:")
    print(drink_df)
    select_drink <- as.integer(readline("Select your drink: "))  # Converted input to integer
    
    # Initialize price_z and price_d variables
    price_z <- 0
    price_d <- 0
    
    # Check if selected pizza and drink IDs are valid
    if(select_pizza %in% pizza_df$pizza_id) {
      price_z <- pizza_df[pizza_df$pizza_id == select_pizza,"pizza_price"]
    }
    if(select_drink %in% drink_df$drink_id) {
      price_d <- drink_df[drink_df$drink_id == select_drink,"drink_price"]
    } 
    
    # Calculate and print total price using glue package
    total_price <- price_z + price_d
    print(glue("The total price is {total_price} $"))
    
  } else {
    print("Thank you for visiting!")
  }
}

# Call the pizza_shop function to execute the chat bot
pizza_shop()
