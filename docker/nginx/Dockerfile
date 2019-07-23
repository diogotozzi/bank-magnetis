FROM nginx:1.17.1-alpine

COPY docker/nginx/templates/default.conf /etc/nginx/conf.d/default.conf

RUN mkdir /var/log/app

COPY ./ /app
WORKDIR /app
