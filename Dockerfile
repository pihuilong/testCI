FROM alpine:latest

WORKDIR /build

RUN apk add --no-cache --update \
    nodejs yarn

RUN yarn install

COPY ./ /build

WORKDIR /build
