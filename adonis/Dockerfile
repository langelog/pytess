FROM node:13.8.0-stretch

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    python python-dev python-pip build-essential swig git libpulse-dev \
    locales zip unzip vim curl cmake

RUN npm i -g @adonisjs/cli

RUN echo "alias ll='ls -lah'" >> /root/.bashrc

