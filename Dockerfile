# Stage 1: Build the frontend
FROM node:20 AS frontend

WORKDIR /app/frontend

# Copy frontend code
COPY frontend /app/frontend

# Install dependencies and build
RUN npm install
RUN npm run build

# Stage 2: Build the backend
FROM node:latest AS backend

WORKDIR /app/backend

# Copy backend code
COPY backend /app/backend

# Install dependencies
RUN npm install

# Stage 3: Final image
FROM node:latest

WORKDIR /app

# Copy built frontend from the first stage
COPY --from=frontend /app/frontend/build /app/frontend/build

# Copy built backend from the second stage
COPY --from=backend /app/backend /app/backend

# Set up the combined application
CMD node backend/server.js