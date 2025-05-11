# Use an image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first
COPY package.json package-lock.json ./

# Debugging
RUN ls -al && cat package.json

# Install dependencies
RUN npm install

# Copy other app files
COPY . .

# Command to run your app
CMD ["npm", "start"]
