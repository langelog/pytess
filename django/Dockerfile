FROM python:3.8.1

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    python python-dev python-pip build-essential swig git libpulse-dev \
    locales zip unzip vim curl cmake

RUN echo "alias ll='ls -lah'" >> /root/.bashrc

RUN pip install django
RUN pip install djangorestframework
