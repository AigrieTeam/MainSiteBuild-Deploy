FROM node:10-alpine

WORKDIR /app/frontend

# RUN apk add --update nodejs npm

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