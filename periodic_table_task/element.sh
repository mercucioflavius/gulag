#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
else
  INPUT=$1
  # input is number
  if [[ $INPUT =~ ^[0-9]+$ ]]
  then
    ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements where atomic_number = $INPUT")
  else
    # input is a capitalized letter
    if [[ $INPUT =~ ^[A-Z][a-z]?$ ]]
    then
      ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements where symbol = '$INPUT'")
    else
      # input is a name
      if [[ $INPUT =~ ^[a-zA-Z]+$ ]]
      then
        ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements where name = '$INPUT'")
        else
          # invalid input
          echo "I could not find that element in the database."
      fi
    fi
  fi

  # if inputed element exist
  if [[ -z $ELEMENT_ID ]]
  # output message
  then
    echo "I could not find that element in the database."
  else
    ELEMENT_ATOMIC_NUMBER=$(echo $ELEMENT_ID)
    ELEMENT_SYMBOL=$(echo $($PSQL "SELECT symbol FROM elements WHERE atomic_number = $ELEMENT_ID") | sed -r 's/^ *| *$//g')
    ELEMENT_NAME=$(echo $($PSQL "SELECT name FROM elements WHERE atomic_number = $ELEMENT_ID") | sed -r 's/^ *| *$//g')
    ELEMENT_TYPE=$(echo $($PSQL "SELECT type FROM properties INNER JOIN types USING(type_id) WHERE atomic_number = $ELEMENT_ID") | sed -r 's/^ *| *$//g')
    ELEMENT_MASS=$(echo $($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ELEMENT_ID") | sed -r 's/^ *| *$//g')
    ELEMENT_MPC=$(echo $($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ELEMENT_ID") | sed -r 's/^ *| *$//g')
    ELEMENT_BPC=$(echo $($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ELEMENT_ID") | sed -r 's/^ *| *$//g')
    
    echo "The element with atomic number $ELEMENT_ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MPC celsius and a boiling point of $ELEMENT_BPC celsius."
  fi
fi



