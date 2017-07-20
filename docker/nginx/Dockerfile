FROM nginx:alpine

ARG project

RUN addgroup -g 1000 -S www-data \
  && adduser -u 1000 -D -S -G www-data www-data \
  && echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories \
  && apk --no-cache add shadow && usermod -u 1000 www-data

ADD nginx/nginx.conf /etc/nginx/
ADD nginx/sites-available/$project.conf /etc/nginx/sites-available/

RUN mkdir /etc/nginx/sites-enabled \
  && ln -sf /etc/nginx/sites-available/* /etc/nginx/sites-enabled/

WORKDIR /var/www/$project
RUN chown -R www-data:www-data /var/www/$project

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
