FROM alpine:latest

FROM node:18-alpine AS deps

RUN apk add --no-cache libc6-compat
WORKDIR /app
COPY confetti/package.json confetti/yarn.lock ./
RUN yarn install --frozen-lockfile

FROM node:18-alpine AS builder

WORKDIR /app

COPY confetti/ ./

COPY --from=deps /app/node_modules ./node_modules

RUN yarn build

FROM node:18-alpine AS runner

WORKDIR /usr/app

COPY --from=builder /app/build ./build
COPY ./confetti/package.json .

RUN yarn

RUN mkdir /etc/bird

RUN apk update && apk add --no-cache \
    bird \
    keepalived \
    mtr \
    tcptraceroute

RUN apk add --no-cache -X https://dl-cdn.alpinelinux.org/alpine/edge/testing bgpq4
ENV NODE_ENV="production"

CMD ["/bin/sh", "-c", "bird -c /etc/bird/bird.conf && node build/index.js"]