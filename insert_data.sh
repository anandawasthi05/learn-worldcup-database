#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams, games;")

echo $($PSQL "INSERT INTO teams(name) VALUES('France');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Croatia');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Belgium');")
echo $($PSQL "INSERT INTO teams(name) VALUES('England');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Russia');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Sweden');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Brazil');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Uruguay');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Switzerland');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Japan');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Mexico');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Denmark');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Spain');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Portugal');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Argentina');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Germany');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Netherlands');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Costa Rica');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Chile');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Nigeria');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Algeria');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Greece');")
echo $($PSQL "INSERT INTO teams(name) VALUES('United States');")
echo $($PSQL "INSERT INTO teams(name) VALUES('Colombia');")

#Inserting data into games table

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    #get winner_id
    WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")"
    #get opponent_id
    OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"
    #inserting row into games table
    echo $($PSQL "INSERT INTO games(year,round,winner_goals,opponent_goals,winner_id,opponent_id) VALUES($YEAR, '$ROUND', $WINNER_GOALS, $OPPONENT_GOALS, $WINNER_ID, $OPPONENT_ID);")
  fi
done