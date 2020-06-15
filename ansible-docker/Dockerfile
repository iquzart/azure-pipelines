FROM node:lts-alpine
LABEL Maintainer="Muhammed Iqbal"
# Create app directory
WORKDIR /usr/src/app
 
# Install app dependencies
COPY package*.json ./
RUN npm ci --only=production
 
# Bundle app source
COPY . .
CMD [ "npm", "run", "start:prod" ]