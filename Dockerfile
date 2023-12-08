FROM ubuntu:22.04

WORKDIR /app/frontend
RUN apt-get update && apt install curl
RUN curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh 
RUN apt-get install -y nodejs npm && apt-get install mysql-server -y

RUN git clone https://github.com/AigrieTeam/frontend.git .
RUN ls /app/frontend
RUN cd /app/frontend
RUN npm install && npm run build

WORKDIR /app/backend

RUN git clone https://github.com/AigrieTeam/backend.git .
RUN ls /app/backend
RUN cd /app/backend
RUN npm install

RUN node /app/backend/server.js