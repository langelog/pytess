FROM langelog/pytess:07feb20_spacy

WORKDIR /app

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    curl

RUN echo "alias ll='ls -lah'" >> /root/.bashrc
RUN pip install django
RUN pip install djangorestframework
