FROM langelog/pytess:09feb20_django

WORKDIR /app

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    curl

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
