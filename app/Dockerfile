FROM python:3.8-slim-buster

LABEL maintainer="athibet.pi@gmail.com"

ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY ./requirements requirements
RUN pip install -r requirements/base.txt

COPY . .

RUN useradd user
USER user
