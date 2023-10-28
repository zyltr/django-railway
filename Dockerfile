FROM python:latest

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /usr/src/railway

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY ./ ./

CMD python manage.py migrate && gunicorn website.wsgi
