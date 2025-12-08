FROM ubuntu:24.04

RUN apt update && apt install apache2 -y && \
        sed -i 's/Listen 80/Listen 5001/' /etc/apache2/ports.conf && \
        sed -i 's/<VirtualHost \*:80>/<VirtualHost \*:5001>/' /etc/apache2/sites-available/000-default.conf

EXPOSE 5001

CMD ["apache2ctl", "-D", "FOREGROUND"]