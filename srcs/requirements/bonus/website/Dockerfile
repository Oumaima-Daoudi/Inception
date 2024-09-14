FROM debian:bullseye

RUN apt-get update && \
    apt-get -y install curl && \
    curl -fsSL https://deb.nodesource.com/setup_current.x | bash - && \
    apt-get install -y nodejs

WORKDIR /my_app

COPY package.json .

RUN npm install

RUN npm install -g @angular/cli

COPY . .

CMD ["ng","serve","--host", "0.0.0.0"]