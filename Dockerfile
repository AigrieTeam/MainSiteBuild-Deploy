FROM alpine/git as frontend

WORKDIR /app/frontend

RUN git clone https://github.com/AigrieTeam/frontend.git .
RUN ls /app/frontend

# FROM node:20 as frontend-build

# WORKDIR /app/frontend

# RUN ls /app/frontend
# RUN npm install
# RUN npm run Build

# FROM alpine/git as backend

# WORKDIR /app/backend

# RUN git clone https://github.com/AigrieTeam/backend.git .



# FROM node:20 as backend-build

# WORKDIR /app/backend

# RUN ls /app/backend
# RUN npm install

# FROM nginx:alpine

# COPY --from=frontend-build /app/frontend/build /usr/share/nginx/html
# COPY --from=backend-build /app/backend /app/backend

# CMD ["node", "/app/backend/server.js"]