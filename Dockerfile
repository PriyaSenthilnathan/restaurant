# Use official Node.js image
FROM node:18

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json from frontend folder
COPY FRONTEND/package.json FRONTEND/package-lock.json ./

# Install dependencies
RUN npm install

# Copy all frontend files into container
COPY frontend .

# Expose the port if needed (depends on your app)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
