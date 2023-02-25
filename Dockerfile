FROM ubuntu:22.04

ENV TZ=Asia/Kolkata \
    DEBIAN_FRONTEND=noninteractive

#Update and upgrade 
RUN apt-get update && apt-get upgrade -y

#install nginx and php and 
RUN apt install nginx -y
 
#Install php
RUN apt-get install php-fpm php-mysql -y

#Install mysql
RUN apt-get install mysql-server -y

#Install ufw    
RUN apt-get install ufw -y

#Firewall allow
RUN ufw allow 'Nginx HTTP'

#Set servername
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

#Remove default index.html
# RUN rm /var/www/html/index.html

COPY . /var/www/html

#Expose port 80
EXPOSE 80

#Start nginx
CMD ["nginx", "-g", "daemon off;"]

