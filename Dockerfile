# Use Node.js Alpine image
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package files from the subdirectory
COPY portfolio-main/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app from the subdirectory
COPY portfolio-main/ .

# Expose port (change if your app uses a different one)
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
