# pull the official base image
FROM python:3.12-alpine

# set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# copy project
COPY . /usr/src/app/

# install dependencies
RUN pip install --upgrade pip
RUN pip install -r /usr/src/app/requirements.txt

# set work directory
WORKDIR /usr/src/app/django_htmx
