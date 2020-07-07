FROM langelog/pytess:07feb20_spacy

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libglib2.0-0 \
    libnss3 \
    libgconf-2-4 \
    libfontconfig1 \
    xvfb \
    firefox-esr \
    texlive_full

RUN pip install --upgrade pip
RUN python -m spacy download es_core_news_md


