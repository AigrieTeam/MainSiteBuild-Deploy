FROM alpine/git as frontend

WORKDIR /app/frontend

RUN git clone https://github.com/username/frontend.git .

FROM alpine/git as backend

WORKDIR /app/backend

RUN git clone https://github.com/username/backend.git .

FROM node:latest as frontend-build

WORKDIR /app/frontend

RUN npm install
RUN npm run Build

FROM node:latest as backend-build

WORKDIR /app/backend

RUN npm install

FROM nginx:alpine

COPY --from=frontend-build /app/frontend/build /usr/share/nginx/html
COPY --from=backend-build /app/backend /app/backend

CMD ["node", "/app/backend/server.js"]