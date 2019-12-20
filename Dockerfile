FROM ubuntu:16.04

MAINTAINER TaiVV<vovantaibka@gmail.com>

# Update ubuntu
RUN apt-get update

# Install pm2 
# RUN wget -qO- https://getpm2.com/install.sh | bash

## Install curl
RUN apt-get install -y curl
## Install node.js v10.x
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install -y nodejs
RUN node -v
RUN npm -v
## Install pm2
RUN npm install pm2 -g

WORKDIR /var/www/project

COPY ./webroot/* /var/www/project/

COPY start.sh /var/www/project

RUN chmod a+x /var/www/project/*

ENTRYPOINT ["/var/www/project/start.sh"]

EXPOSE 80
