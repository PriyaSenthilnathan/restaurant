# Build Stage
FROM node:20 AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Production Stage
FROM nginx:stable-alpine

# Copy built files to nginx html folder
COPY --from=build /app/dist /usr/share/nginx/html

# Copy nginx config (optional if you need custom config)
# COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

