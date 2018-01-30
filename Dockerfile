FROM iconocoders/ubuntu-nginx

RUN rm -rf /var/www/html/*
COPY ./auth.json /root/.composer/auth.json
RUN composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition /var/www/html

RUN rm -f /etc/nginx/sites-enabled/default
COPY ./nginx.conf  /etc/nginx/sites-enabled/default

WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html
RUN su www-data -c "cd /var/www/html && composer install"
RUN chmod -R 777 /var/www/html/pub/media /var/www/html/app/etc

# Add cron job
RUN apt-get -y install cron
ADD crontab /etc/cron.d/magento2-cron
RUN chmod 0644 /etc/cron.d/magento2-cron
RUN crontab -u www-data /etc/cron.d/magento2-cron

COPY ./bin/install-magento /var/www/html/install-magento
RUN /var/www/html/install-magento

EXPOSE 80
