FROM alpine:latest

RUN apk add --no-cache bird

ENTRYPOINT ["bird", "-f", "-c", "/etc/bird.conf"]
