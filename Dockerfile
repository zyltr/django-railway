FROM python:latest

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR railway/

RUN python -m pip install --upgrade pip

RUN python -m venv venv
ENV PATH=/railway/venv/bin:$PATH

COPY requirements.txt ./
RUN python -m pip install -r requirements.txt

COPY railway.sh ./
RUN chmod +x railway.sh

COPY ./ ./

CMD sh railway.sh
