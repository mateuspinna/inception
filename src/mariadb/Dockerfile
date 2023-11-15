# syntax=docker/dockerfile:1

# Base image
FROM	debian:bullseye

# Installing mariadb
RUN		apt update && \
		apt install -y --no-install-recommends --no-install-suggests \
		mariadb-server

# Mounting the mariadb config file inside my container
COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# Exposing the port 3306
EXPOSE	3306

# Mounting my script inside the container. It will be used to create my wordpress database.
COPY	tools/create-database-script.sh /bin/
RUN		chmod +x /bin/create-database-script.sh

# Running my script
CMD		["create-database-script.sh"]
