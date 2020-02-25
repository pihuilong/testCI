FROM node:12

COPY . /app
WORKDIR /app
RUN npm -v && node -v
RUN npm install -g yarn

RUN yarn install
