FROM ubuntu:22.04

WORKDIR /app/frontend
RUN apt-get update && apt-get install mysql-server -y && apt-get install curl -y
RUN curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o install_nvm.sh
RUN bash install_nvm.sh
RUN . ~/.bashrc && nvm install --lts
RUN nvm --version


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