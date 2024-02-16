#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$((1 + $RANDOM % 1000))
GUESS_NUMBER=1
INPUT=-1

echo -e "Enter your username:"
read USERNAME

DB_USERNAME=$($PSQL "SELECT username FROM games WHERE username = '$USERNAME' LIMIT 1")

if [[ -z $DB_USERNAME ]]
then
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_COUNT=$($PSQL "SELECT COUNT(*) FROM games WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE username = '$USERNAME'")
  echo -e "Welcome back, $USERNAME! You have played $GAMES_COUNT games, and your best game took $BEST_GAME guesses."
fi

echo -e "Guess the secret number between 1 and 1000:"

while [[ $INPUT != $SECRET_NUMBER ]]
do
  read INPUT
  if [[ $INPUT -lt $SECRET_NUMBER ]]
  then
    echo -e "It's higher than that, guess again:"
    ((GUESS_NUMBER++))
  fi
  if [[ $INPUT -gt $SECRET_NUMBER ]]
  then
    echo -e "It's lower than that, guess again:"
    ((GUESS_NUMBER++))
  fi
  if [[ $INPUT =~ .*[^\-0-9]+.* ]]
  then
    echo -e "That is not an integer, guess again:"
  fi
done

DB_INSERT_RESLT=$($PSQL "INSERT INTO games(username, number_of_guesses) VALUES('$USERNAME', $GUESS_NUMBER)")

echo -e "You guessed it in $GUESS_NUMBER tries. The secret number was $SECRET_NUMBER. Nice job!"
