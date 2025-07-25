##define function
pyc <- function () {
  #define choices
  choices<- c("hammer", "scissor", "paper")
  player_points <- 0
  bot_points  <- 0
  game_count <- 0
  tie_points <- 0

## game count
  while (game_count < 10) {
    player_hand <- readline("Enter your hand (1.rock, 2.scissors, 3.paper): ")
    bot_hand <- sample(choices, 1)
    message(paste("BOT choice:", bot_hand))

## compare the results
    if (player_hand == bot_hand) {
      message("Tie!!")
      tie_points <- tie_points + 1
    } else if (player_hand == "rock" & bot_hand == "scissors" |
               player_hand == "scissors" & bot_hand == "paper" |
               player_hand == "paper" & bot_hand == "rock") {
      message("Win!!")
      player_points <- player_points + 1
    } else {
      message("Lose!!")
      bot_points <- bot_points + 1
    }

## loop exit
    game_count = game_count + 1
  }
  message("Thank you for plaing 10 games.")
  message(paste("Score: Player", player_points, "// BOT", bot_points, "// Ties", tie_points))  
}

pyc ()