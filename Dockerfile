# Use an official Node.js image as a base image
FROM node:20.8.0

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to install app dependencies
COPY mongo/package*.json ./

# Install app dependencies inside the container
RUN npm install

# Copy the rest of the application files into the container
COPY mongo/ .

# Declare the port number the container will listen on
EXPOSE 3000

# Command to run the application inside the container
CMD [ "node", "server.js" ]
