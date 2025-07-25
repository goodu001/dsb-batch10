## homework 
## 1. chatbot order Pizza 
install.packages("glue")

library(glue)
## crust 

list_crust <- data.frame(list(
  crust_id = 1:3,
  crust_name = c("Extreme Crust",
                 "Pan",
                 "Thin"), 
  price = c(30,15,10)
))

## topping 
list_topping <- data.frame(list(
  topping_id = 1:5,
  topping_name = c(
    "Seafood Cocktail"
    ,"Hawaiian",
    "Double Cheese",
    "Ham&Mushroom",
    "Tom Yum Kung"
  ),
  price = c(439,379,299,129,439)
))

## other 
list_other <- data.frame(list(
  other_id = 1:3,
  other_name = c(
    "Coke"
    ,"Crispy onions",
    "BBQ Chickern Wings"
  ),
  price = c(45,79,149)
))

wel <- "yes"

pizza <- function() {
  print(c("Hello", 
          "My name is Ai,welcome to pizzeria restaurant!"
  ))
  welcome <- readline("How can i help you?")
  ### home 
  if(tolower(welcome == wel)){
    ## crust 
    print("Select your crust")
    print(list_crust)
    select_crust <- readline("Pls select crust")
    ## topping 
    print("Select your topping")
    print(list_topping)
    select_menu <- readline("Select your topping")
    other <- readline("Anything else .....")
    if(other == wel) {
      ## other 
      print(list_other)
      select_other <- readline("Pls select")
    } else {
      print("Thank for your serving")
    }
    
    if(select_crust %in% list_crust$crust_name) {
      price_c <- list_crust[which(list_crust$crust_name == select_crust), "price"]
    }
    
    if(select_menu %in% list_topping$topping_name) {
      price_t <- list_topping[which(list_topping$topping_name == select_menu),"price"]
    } 
    
    if(select_other %in% list_other$other_name) {
      price_o <- list_other[which(list_other$other_name == select_other), "price"]
    } 
    
    print(paste0("The total price is ", price_c + price_t + price_o, " $"))
  } else {
    print("Thank for your serving")
  }
}

pizza()





