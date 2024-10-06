#!/bin/bash

# Select element from periodic_table database

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $# -lt 1 ]]; then
 echo  "Please provide an element as an argument."
 exit 0
elif [[ $1 =~ ^[0-9]+$ ]]; then
  ATOMIC_NUMBER="$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")"
else
  ATOMIC_NUMBER="$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1' OR name='$1'")"
fi

if [[ -z $ATOMIC_NUMBER ]]; then
  echo "I could not find that element in the database."
else 
  RESULT="$($PSQL "select symbol, name, t.type, atomic_mass, melting_point_celsius, boiling_point_celsius  from elements left join properties using (atomic_number) left join types as t using (type_id) where atomic_number=$ATOMIC_NUMBER")"

  IFS="|" read SYMBOL  NAME TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<< $RESULT
  
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
fi
