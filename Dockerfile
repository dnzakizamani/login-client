FROM node:18-alpine AS builder

# Install build dependencies for Alpine
RUN apk add --no-cache python3 make g++

WORKDIR /app
COPY package*.json ./
COPY package-lock.json ./
RUN npm ci

# Copy file konfigurasi penting
COPY vite.config.js ./
COPY babel.config.js ./
COPY postcss.config.js ./
COPY tailwind.config.js ./
COPY .env* ./

# Copy source code
COPY src/ ./src/
COPY index.html ./
COPY public/ ./public/

# Increase memory limit for Node.js during build
ENV NODE_OPTIONS="--max-old-space-size=4096"
RUN npm run build

FROM nginx:alpine AS production
COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]