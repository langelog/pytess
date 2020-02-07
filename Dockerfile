FROM python:3.6.7

#COPY . /app/

WORKDIR /tess

RUN apt-get update && apt-get install -y \
    python python-dev python-pip build-essential swig git libpulse-dev \
    build-essential \
    locales \
    zip unzip \
    vim \
    git \
    curl \
    cmake \
    swig \
    g++ \
    autoconf automake libtool \
    pkg-config \ 
    libpng-dev \
    libjpeg62-turbo-dev \
    libtiff5-dev \
    zlib1g-dev \
    libicu-dev \
    libpango1.0-dev \
    libcairo2-dev

COPY ./Installers/tesseract_4.1.0.zip /tess
COPY ./Installers/leptonica-1.78.0.tar.gz /tess

#RUN tar zxvf leptonica-1.78.0.tar.gz && cd leptonica-1.78.0 && mkdir build && cd build && cmake .. && make && make install
RUN tar zxvf leptonica-1.78.0.tar.gz && cd leptonica-1.78.0 && mkdir build && cd build && cmake .. && make && make install

ENV PATH="/usr/local/lib:${PATH}"

#RUN 'unzip tesseract_4.1.0.zip && cd tesseract-4.1.0 && ./autogen.sh && ./configure && make && make install && ldconfig'
RUN unzip tesseract_4.1.0.zip && cd tesseract-4.1.0 && ./autogen.sh && ./configure && make && make install && ldconfig

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    poppler-utils \
    screen
    
RUN pip install --upgrade pip

RUN pip install spacy
RUN python -m spacy download es_core_news_md

#RUN pip install -r requirements.txt

#EXPOSE 8888
#CMD ["python", "worker.py"]
