# syntax=docker/dockerfile:1

# Base image
FROM	debian:bullseye

RUN		apt update && apt install --no-install-recommends --no-install-suggests -y \
		php7.4-fpm -y \
		php7.4-mysql -y \
		wget

EXPOSE 9000

CMD		["sh"]
