FROM node:lts-alpine AS build-env

# Upgrade OS dependencies
RUN apk update && apk upgrade

# Set the working directory to the location of our app
WORKDIR /opt/app

# Copy Node.js App dependency manifest
COPY package.json ./package.json

# Use exactly the same versions as in local environment
COPY package-lock.json ./package-lock.json

# Install Node.js dependencies
RUN npm install

# Copy app to the working direcotry in the docker image
COPY ./ ./

# Build the App inside the image
RUN npm run build 

##################

# Production Build
FROM nginx:stable-alpine

# Upgrade OS dependencies
RUN apk update && apk upgrade

# Configure Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Copy from build stage
WORKDIR /usr/share/nginx/html
COPY --from=build-env /opt/app/build .

