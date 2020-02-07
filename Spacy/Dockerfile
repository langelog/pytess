FROM langelog/pytess:06feb20

WORKDIR /app

RUN apt-get update && apt-get upgrade -y

RUN pip install --upgrade pip
RUN pip install spacy
RUN pip install jupyter
RUN python -m spacy download es_core_news_md


