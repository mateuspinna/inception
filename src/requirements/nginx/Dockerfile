# syntax=docker/dockerfile:1

# Base image
FROM alpine:3.17

# Install nginx and openssl
RUN apk update && apk add --no-cache nginx openssl

COPY ./conf/nginx.conf /etc/nginx/
COPY ./tools/setup.sh /tmp/

RUN chmod +x tmp/setup.sh

#CMD ["sh"]
RUN ./tmp/setup.sh

ENTRYPOINT ["nginx", "-g", "daemon off;"]
