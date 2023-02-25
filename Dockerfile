FROM ubuntu:22.04

ENV TZ=Asia/Kolkata \
    DEBIAN_FRONTEND=noninteractive

#Update and upgrade 
RUN apt-get update && apt-get upgrade -y

#install
RUN apt-get install curl php apache2 mysql-server php-mysqli php-mysql php-gd php-curl php-mbstring php-soap php-intl php-zip -y

#Install ufw
RUN apt-get install ufw -y

#Firewall allow 
RUN ufw allow 'Apache'

#Set servername
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 775 /var/www/html
    
#Remove default index.html
RUN rm /var/www/html/index.html

COPY . /var/www/html

#Expose port 80
EXPOSE 80

#Start apache2
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
