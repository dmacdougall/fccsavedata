#!/bin/bash

echo -e "\n~~~~~ MY SALON ~~~~~"

PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

SERVICES="$($PSQL "SELECT * FROM services order by service_id")"
MAIN_MENU() {
  if [[ $1 != "" ]] 
  then
  echo -e "\n$1 What would you like today?"
  else
    echo -e "\nWelcome to My Salon, how can I help you?"
  fi
  echo "$SERVICES" | while IFS=" | " read ID  SERVICE 
  do
    if [[ $ID != "service_id" ]]; then
      echo "$ID) $SERVICE"
    fi
  done
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]; then
    MAIN_MENU "I could not find that service."
  else 
    SERVICE_NAME="$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")"
    echo $SERVICE_NAME
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_ID="$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")"
    if [[ -z $CUSTOMER_ID ]]; then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      ADD_NAME="$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")"
      CUSTOMER_ID="$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")"
    else
      CUSTOMER_NAME="$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID")"
    fi
    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME
    APPT_RESULT="$($PSQL "INSERT INTO appointments(service_id, customer_id, time) VALUES($SERVICE_ID_SELECTED, $CUSTOMER_ID,'$SERVICE_TIME')")"
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi

}

MAIN_MENU 
