#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ IMAGINARY SALON ~~~~~\n"

MAIN_MENU(){
  # message
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "\nWelcome to\n\n~Imaginary~Mystery~Salon~Of~Freedom~\n\nWould you want to...:"
  fi

  # display services
  SERVICES=$($PSQL "SELECT * FROM services")
  echo -e "0) exit"
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo -e "$SERVICE_ID) $SERVICE_NAME"
  done

  # taking service_id from user
  read SERVICE_ID_SELECTED
  # if input not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "Try to pick one of these:"
  else
    if [[ $SERVICE_ID_SELECTED = 0 ]]
    then 
      echo -e "\nBye."
    else
      SERVICE_ID_SELECTED=$($PSQL "SELECT service_id FROM services where service_id = $SERVICE_ID_SELECTED")
      # invalid id
      if [[ -z $SERVICE_ID_SELECTED ]]
      then
        MAIN_MENU "Sorry, but that option is not available. Try one of these:"
      else
        APPOINTMENT_MENU $SERVICE_ID_SELECTED
      fi
    fi
  fi
}

APPOINTMENT_MENU(){
  # message
  if [[ $2 ]]
  then
    echo -e "\n$2"
  else
    echo -e "\nLet's put you in scedule"
  fi

  # service_id and service_name
  SERVICE_ID_SELECTED=$1
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  # erasing spaces near service_name
  SERVICE_NAME=$(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    # get new customer name
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME
    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  else
    echo -e "\nNice to meet you again, $CUSTOMER_NAME"
  fi

  # erasing spaces near customer_name
  CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')

  # getting customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # getting service_time
  echo -e "\nChoose a time:"
  read SERVICE_TIME

  # inserting appointment
  APPOITMENT_INSERT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

}


MAIN_MENU
