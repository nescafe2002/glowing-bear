FROM node:alpine AS builder

WORKDIR /usr/src/app

RUN apk add --no-cache --update git && rm -rf /var/cache/apk/*
RUN git clone https://github.com/glowing-bear/glowing-bear.git /usr/src/app
RUN npm install
RUN npm run build

FROM caddy:alpine

COPY --from=builder /usr/src/app/build /usr/share/caddy
