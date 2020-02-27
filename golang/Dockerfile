FROM golang:1.14.0-buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    python python-dev python-pip build-essential swig git libpulse-dev \
    locales zip unzip vim curl cmake

RUN echo "alias ll='ls -lah'" >> /root/.bashrc

