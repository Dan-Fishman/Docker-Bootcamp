#!/bin/bash

# set bash fail on errors or unset varraibles
set -o errexit
set -o pipefail
set -o nounset

# idempotent django commands
python manage.py makemigrations
python manage.py migrate

exec "$@"