# Define variables for player and enemy health
player_health <- 100
enemy_health <- 100

# Define function for shooting action
shoot <- function() {
  # Generate a random hit probability between 0 and 1
  hit_prob <- runif(1, 0, 1)
  
  # Determine if the player hit or missed
  if (hit_prob > 0.5) {
    # Player hit, reduce enemy health
    damage <- sample(10:20, 1)
    enemy_health <<- max(enemy_health - damage, 0)
    message("You hit the enemy for ", damage, " damage.")
  } else {
    # Player missed
    message("You missed the enemy!")
  }
}

# Define function for reloading action
reload <- function() {
  # Add 10 bullets to player ammo
  player_ammo <<- min(player_ammo + 10, 30)
  message("You reloaded and gained 10 bullets.")
}

# Define function for enemy attack
enemy_attack <- function() {
  # Generate a random hit probability between 0 and 1
  hit_prob <- runif(1, 0, 1)
  
  # Determine if the enemy hit or missed
  if (hit_prob > 0.2) {
    # Enemy hit, reduce player health
    damage <- sample(5:15, 1)
    player_health <<- max(player_health - damage, 0)
    message("The enemy hit you for ", damage, " damage.")
  } else {
    # Enemy missed
    message("The enemy missed you!")
  }
}

# Define function for game over
game_over <- function() {
  if (player_health == 0) {
    message("You lost! The enemy defeated you.")
    return(TRUE)
  } else if (enemy_health == 0) {
    message("You won! You defeated the enemy.")
    return(TRUE)
  } else {
    return(FALSE)
  }
}

# Main game loop
player_ammo <- 30

while (!game_over()) {
  # Display game status
  message("\n========================")
  message("Player health: ", player_health)
  message("Enemy health: ", enemy_health)
  message("Player ammo: ", player_ammo)
  message("========================\n")
  
  # Get player action
  action <- readline(prompt = "Choose your action (shoot/reload): ")
  
  # Perform player action
  if (action == "shoot") {
    if (player_ammo == 0) {
      message("You are out of ammo!")
    } else {
      shoot()
      player_ammo <<- max(player_ammo - 1, 0)
    }
  } else if (action == "reload") {
    reload()
  } else {
    message("Invalid action! Choose shoot or reload.")
  }
  
  # Perform enemy action
  enemy_attack()
}
