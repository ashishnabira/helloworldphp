FROM alpine:3.7
MAINTAINER ashish.nabira@gmail.com
RUN apk --update add nginx php7-fpm
RUN mkdir -p /tmp/nginx && echo "clear_env = no" >> /etc/php7/php-fpm.conf
RUN mkdir -p /run/nginx
ADD www /www
ADD nginx.conf /etc/nginx/
EXPOSE 80
CMD php-fpm7 -d variables_order="EGPCS" && exec nginx -g "daemon off;"
