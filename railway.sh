#!/usr/bin/env sh

python manage.py check --deploy
python manage.py migrate --noinput
python manage.py collectstatic --noinput
gunicorn website.wsgi
