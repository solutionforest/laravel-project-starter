FROM richarvey/nginx-php-fpm:latest
RUN apk update && apk add --no-cache postgresql-dev && docker-php-ext-install pdo pdo_pgsql

# Copy app code
WORKDIR /var/www/html
COPY ./web /var/www/html
RUN rm -Rf /var/www/html/.git
