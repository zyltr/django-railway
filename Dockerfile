FROM python:latest as python

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR railway/

RUN python -m venv venv
ENV PATH=/railway/venv/bin:$PATH

RUN pip install --upgrade pip

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY ./ ./


# Staging
FROM python as development

RUN pip install django-extensions ipython

CMD ["sh", "-c", "python manage.py check --deploy && python manage.py migrate --noinput && python manage.py collectstatic --noinput && python manage.py runserver --nostatic 0.0.0.0:8000"]


# Production
FROM python as production

COPY railway.sh ./
RUN chmod +x railway.sh

CMD sh railway.sh
