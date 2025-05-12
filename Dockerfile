# Use a newer Node.js image (Node 20+) because your packages require it
FROM node:20

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json from frontend folder
COPY FRONTEND/package.json FRONTEND/package-lock.json ./

# Install dependencies (with network retries to handle ECONNRESET errors)
RUN npm install --network-timeout=100000

# Copy all frontend files into container
COPY FRONTEND .

# Expose the port (assuming your frontend dev server runs on 3000)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
