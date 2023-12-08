FROM node:16

WORKDIR /app/frontend
RUN apt-get update && apt-get install -y git

# Install MySQL client and server
RUN apt-get install -y mysql-server mysql-client
# RUN curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
# RUN . ~/.profile 
# RUN nvm install node


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