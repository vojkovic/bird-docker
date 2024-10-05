FROM alpine:latest

RUN apk add --no-cache bird

CMD ["bird", "-f", "-c", "/etc/bird.conf"]
