#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME
USER_INFO="$($PSQL "SELECT * from users WHERE name='$USERNAME'")"

if [[ -z $USER_INFO ]]; then  
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  RESULT="$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")"
else
  IFS='|' read NAME PLAYED BEST <<< "$USER_INFO"
  echo "Welcome back, $USERNAME! You have played $PLAYED games, and your best game took $BEST guesses."
fi


echo "Guess the secret number between 1 and 1000:"

NUMBER=$(( $RANDOM % 1000 + 1 ))
GUESSES=0
while [[ 1 ]]; do
  GUESSES=$(( $GUESSES + 1 ))
  read INPUT
  if [[ ! $INPUT =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
  elif [[ $INPUT -eq $NUMBER ]]; then
    echo "You guessed it in $GUESSES tries. The secret number was $NUMBER. Nice job!"
    break
  elif [[ $NUMBER -lt $INPUT ]]; then
    echo "It's lower than that, guess again:"
  else 
    echo "It's higher than that, guess again:"
  fi
done

RESULT="$($PSQL "UPDATE users SET played=played+1 WHERE name='$USERNAME'")"
RESULT="$($PSQL "UPDATE users SET best=$GUESSES WHERE name='$USERNAME' AND (best=0 OR best > $GUESSES)")"
