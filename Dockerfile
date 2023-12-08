FROM ubuntu:22.04

WORKDIR /app/frontend

RUN apt-get update && apt-get install -y nodejs npm && apt-get install mysql-server -y
RUN npm cache clean -f && npm install -y -g n && n stable
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