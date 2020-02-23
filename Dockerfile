FROM alpine:latest

COPY . /app

WORKDIR /app

RUN apk add --no-cache --update \
    nodejs yarn

RUN yarn install
