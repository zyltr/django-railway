FROM python:latest

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR railway

RUN python -m venv venv

ENV VIRTUAL_ENV venv
ENV PATH $VIRTUAL_ENV/bin:$PATH

RUN pip install --upgrade pip

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY railway.sh ./
RUN chmod +x railway.sh

COPY ./ ./

CMD sh railway.sh
