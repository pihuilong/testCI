FROM node:12

COPY . /app
WORKDIR /app

RUN npm install -g -s --no-progress yarn

RUN yarn install
