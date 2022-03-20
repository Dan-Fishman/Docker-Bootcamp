#!/bin/bash

# set bash fail on errors or unset varraibles
set -o errexit
set -o pipefail
set -o nounset

# dependent services health check (postgres)
is_postgres_alive() {
    python << END
import sys

from psycopg2 import connect
from psycopg2.errors import OperationalError

try:
    connect(
        dbname="${DJANGO_POSTGRES_DATABASE}",
        user="${DJANGO_POSTGRES_USER}",
        password="${DJANGO_POSTGRES_PASSWORD}",
        host="${DJANGO_POSTGRES_HOST}",
        port="${DJANGO_POSTGRES_PORT}",
    )
except OperationalError:
    sys.exit(-1)
END
}

until is_postgres_alive; do
    >&2 echo "Waiting for PostgreSQL to become available..."
    sleep 2
done
>&2 echo "PostgreSQL is available"

# idempotent django commands
python manage.py makemigrations
python manage.py migrate

exec "$@"