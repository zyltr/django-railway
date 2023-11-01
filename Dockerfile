FROM python:latest

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR railway

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY railway.sh ./
RUN chmod +x railway.sh

COPY ./ ./

CMD sh railway.sh
