FROM node:12-alpine

COPY . /app
WORKDIR /app
RUN npm -v && node -v
RUN yarn -v

RUN yarn install

CMD [ "yarn", "start" ]
