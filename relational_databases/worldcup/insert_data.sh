#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games restart identity")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPP WGOALS OGOALS 
do
if [[ $YEAR != year ]]
then
  TEAM_NAME=$($PSQL "select team_id from teams where name = '$WINNER'")
      # if not found

    if [[ -z $TEAM_NAME ]]
    then
      # insert major
      INSERT_TEAM_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_NAME == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi

      # get new major_id
      TEAM_NAME=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi
  OTEAM_NAME=$($PSQL "select team_id from teams where name = '$OPP'")
  
    if [[ -z $OTEAM_NAME ]]
    then
      # insert major
      INSERT_OTEAM_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$OPP')")
      if [[ $INSERT_OTEAM_NAME == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPP
      fi

      # get new major_id
      TEAM_NAME=$($PSQL "SELECT team_id FROM teams WHERE name='$OPP'")
    fi
fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPP WGOALS OGOALS 
do
if [[ $YEAR != year ]]
then
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OTEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPP'")

    # insert teams
    INSERT_WINNER_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $TEAM_ID, $OTEAM_ID, $WGOALS, $OGOALS)")
    if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into games, $WINNER vs $OPP
    fi
  fi
done
