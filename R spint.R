grading <- function(score) {
  if (score >= 80){
    return("A")
  } else if (score >= 70) {
    return("B")
  } else if (score >= 60) {
    return("C")
  } else if (score >= 50) {
    return("D")
  } else {
    return("F")
  }
}

## for loop
## vectorization

for (i in 1:10) {
  print("hi")
}

for (i in 1:10) {
  if (i %% 2 ++ 0) {
    print(paste0(i, " even no."))
  } else {
    print(paste0(i, " odd no."))
  }
}

nums <- c(25, 30, 40, 100, 1225)

## while loop
count <- 0
while (count < 5) {
  print ("hi")
  count = count +1
  if (count == 5) {
    print("not HI!!!")
  }
}

## take input in a user
user_name <- readline("What is your name : ")
user_pw <- readline("your password : ")

## log in 

users <- c("Dump", "John", "Mary")
pw <- 1234

fb_login <- function() {
  print("welcome to facebook!")
  username <- readline("Username : ")
  password <- readline("Password : ")
  if ((username %in% users) && (password == pw)) {  ##%in% อยู่ใน
    print("Log in successfully!")
  } else {
    print("Try again")
  }
}

## homework
## 1.chatbot order pizza
## 2. pao ying chub




