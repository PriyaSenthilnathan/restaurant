# Build Stage
FROM node:20 AS build

WORKDIR /app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Show files before npm install to debug easily
RUN ls -al && cat package.json

# Install dependencies with verbose output for detailed logs
RUN npm install --verbose

# Copy the rest of the application code
COPY . .

# Build the app
RUN npm run build

# Production Stage
FROM nginx:stable-alpine

# Copy built files to nginx html folder
COPY --from=build /app/dist /usr/share/nginx/html

# Optional: Copy nginx config if you have a custom one
# COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
