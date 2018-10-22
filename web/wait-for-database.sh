#!/bin/sh
# wait-for-postgres.sh

set -e

DB_HOST="$1"
shift
cmd="$@"

until nc -z $DB_HOST 3306; do sleep 1; echo "Waiting for DB to come up..."; done

sleep 5

>&2 echo "database is up - executing command"
exec $cmd