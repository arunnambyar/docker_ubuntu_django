DB_HEALTH=$(python manage.py check --database default)
COUNTER=0

while [[ ${COUNTER} -lt 10 && "$DB_HEALTH" != "System check identified no issues (0 silenced)." ]]
do
  sleep 2
  echo "REPEAT - $DB_HEALTH, $COUNTER"
  let "COUNTER++"
  DB_HEALTH=$(python manage.py check --database default)
done

echo "MySQL Connection established successfully"

echo "Starting django DEV server..."
python manage.py runserver $1