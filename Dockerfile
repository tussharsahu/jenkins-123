FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERD 1

WORKDIR /app

ADD . /app/

COPY ./requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

COPY . /app/

RUN /bin/sh -c python app/manage.py runserver

EXPOSE 8000
