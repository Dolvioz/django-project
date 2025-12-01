# pull the official base image
FROM python:3.12-alpine

# copy project
COPY . /usr/src/app/

# set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# install dependencies
RUN pip install --upgrade pip
RUN pip install -r /usr/src/app/requirements.txt

# set work directory
WORKDIR /usr/src/app/django_htmx
