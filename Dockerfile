# pull official base image
FROM python:3.11.4-slim-buster

# set work directory
WORKDIR /home/ubuntu/project/django_projects

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install django==3.2

COPY ./requirements.txt .
RUN pip install -r requirements.txt
COPY . .


RUN python manage.py migrate
CMD ["python","manage.py","runserver", "0.0.0.0:8002"]