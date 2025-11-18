FROM node:18-alpine AS builder

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

RUN npm run build

FROM nginx:alpine AS production
COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]