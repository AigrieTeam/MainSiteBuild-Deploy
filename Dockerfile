# Stage 1: Clone frontend repository
FROM alpine/git as frontend

WORKDIR /app/frontend

RUN git clone https://github.com/username/frontend.git .

# Stage 2: Clone backend repository
FROM alpine/git as backend

WORKDIR /app/backend

RUN git clone https://github.com/username/backend.git .

# Stage 3: Build frontend
FROM node:latest as frontend-build

WORKDIR /app/frontend

# Install dependencies and build
RUN npm install
RUN npm run build

# Stage 4: Build backend
FROM node:latest as backend-build

WORKDIR /app/backend

# Install backend dependencies
RUN npm install

# Final Stage: Combine built artifacts into a single image
FROM nginx:alpine

COPY --from=frontend-build /app/frontend/build /usr/share/nginx/html
COPY --from=backend-build /app/backend /app/backend

# Set up your backend server and configurations as needed

# Example: Start backend server (replace with your backend startup command)
CMD ["node", "/app/backend/server.js"]
