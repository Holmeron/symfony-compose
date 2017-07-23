FROM node:8-alpine

ARG project

RUN apk add --no-cache bash

VOLUME "/var/www/$project"

WORKDIR /var/www/$project
