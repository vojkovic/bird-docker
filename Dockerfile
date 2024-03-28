FROM alpine:latest

RUN apk add --no-cache bird

RUN echo "bird version: $(bird --version)"

CMD ["bird", "-f", "-c", "/etc/bird/bird.conf"]