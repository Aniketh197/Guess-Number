#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"

echo "Enter your username:"
read USERNAME

USERNAME_AVAIL=$($PSQL "SELECT username FROM users where username='$USERNAME'")

if[[ -x $USERNAME_AVAIL ]]
  then
    INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  else
    echo "Welcome back, $USERNAME! You have played <games_played> games, and your best game took <best_game> guesses."
fi

RANDOM_NUM=$((1 + $RANDOM % 1000))
echo "Guess the secret number between 1 and 1000:"