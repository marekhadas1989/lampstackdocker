FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

####################################################
###############GENERAL SECTION######################
####################################################
RUN apt-get update && apt-get upgrade -yq

RUN apt-get -yq install apt-utils \
&& apt-get -yq install htop \
&& apt-get -yq install ncdu \
&& apt-get -yq install curl \
&& apt-get -yq install nano \
&& apt-get -yq install wget

####################################################
##############APACHE SECTION########################
####################################################
RUN apt-get install -yq apache2

####################################################
###############PHP SECTION##########################
####################################################

RUN apt-get -yq install php php-pear php7.2-dev php7.2-zip php7.2-curl php7.2-gd php7.2-mysql php7.2-xml libapache2-mod-php7.2 php7.2-mysql php7.2-gd php7.2-bcmath php-imagick

####################################################
###############MYSQL SECTION########################
####################################################

RUN apt-get install -yq lsb-release
RUN apt-get install -yq gnupg
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 8C718D3B5072E1F5
RUN wget -c https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb 
RUN dpkg -i mysql-apt-config_0.8.10-1_all.deb
RUN apt update
RUN apt-get -yq install mysql-server

####################################################
################PHP MY ADMIN SECTIO#################
####################################################

RUN apt-get install -yq phpmyadmin

####################################################
###############CERTBOT SECTION######################
####################################################

RUN apt-get update
RUN apt-get -yq install software-properties-common
RUN add-apt-repository universe
RUN add-apt-repository ppa:certbot/certbot
RUN apt-get -yq  update
RUN apt-get -yq install certbot python-certbot-apache

####################################################
###############GOOGLE MOD PAGESPEED#################
####################################################

RUN wget https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb
RUN dpkg -i mod-pagespeed-*.deb
RUN apt-get -f install
RUN rm mod-pagespeed-*.deb 
RUN a2enmod rewrite 

#COPY /apache2.conf /etc/apache2/apache2.conf
#COPY /php.ini /etc/php/7.2/apache2/php.ini
COPY my.cnf /etc/mysql/my.cnf

EXPOSE 80
EXPOSE 3306

COPY /docker-entrypoint.sh /
ENTRYPOINT ["docker-entrypoint.sh"]
