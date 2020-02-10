FROM python:3.8.1

WORKDIR /app

RUN apt-get update && apt-get install -y \
    python python-dev python-pip build-essential swig git libpulse-dev \
    build-essential locales zip unzip vim curl autoconf automake libtool \
    cmake g++ pkg-config libpng-dev libjpeg62-turbo-dev libtiff5-dev zlib1g-dev \
    libicu-dev libpango1.0-dev libcairo2-dev screen

RUN pip install --upgrade pip

