# Use Node.js Alpine base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the application files
COPY . .

# Expose app port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
