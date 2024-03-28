FROM alpine:latest

RUN apk add --no-cache bird

RUN echo "bird version: $(bird -v)"

CMD ["bird", "-f", "-c", "/etc/bird/bird.conf"]