FROM python:3.6.7

#COPY . /app/

#WORKDIR /app

RUN apt-get update && apt-get install -y \
    python python-dev python-pip build-essential swig git libpulse-dev \
    build-essential \
    locales \
    zip unzip \
    vim \
    git \
    curl \
    cmake \
    swig

RUN apt-get install -y g++
RUN apt-get install -y autoconf automake libtool
RUN apt-get install -y pkg-config
RUN apt-get install -y libpng-dev
RUN apt-get install -y libjpeg62-turbo-dev
RUN apt-get install -y libtiff5-dev
RUN apt-get install -y zlib1g-dev

RUN apt-get install -y libicu-dev
RUN apt-get install -y libpango1.0-dev
RUN apt-get install -y libcairo2-dev

COPY ./Installers/tesseract_4.1.0.zip /app
COPY ./Installers/leptonica-1.78.0.tar.gz /app

RUN tar zxvf leptonica-1.78.0.tar.gz && \
    cd leptonica-1.78.0 && \
    mkdir build && cd build && \
    cmake .. && \
    make && make install

ENV PATH="/usr/local/lib:${PATH}"

RUN unzip tesseract_4.1.0.zip && \
    cd tesseract-4.1.0 && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    ldconfig

RUN apt-get install -y \
    poppler-utils

RUN apt-get install -y \
    screen

RUN pip install --upgrade pip

#RUN pip install -r requirements.txt

#EXPOSE 8888
#CMD ["python", "worker.py"]
