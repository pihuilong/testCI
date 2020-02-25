FROM node:12

COPY . /app
WORKDIR /app
RUN npm -v && node -v
RUN yarn -v
RUN npm i -g yarn

RUN yarn install
