FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -yq

RUN apt-get -yq install apt-utils \
&& apt-get -yq install htop \
&& apt-get -yq install ncdu \
&& apt-get -yq install curl \
&& apt-get -yq install nano \
&& apt-get -yq install wget

RUN  apt-get install -yq apache2

RUN apt-get -yq install php php-pear php7.2-dev php7.2-zip php7.2-curl php7.2-gd php7.2-mysql php7.2-xml libapache2-mod-php7.2 php7.2-mysql php7.2-gd php7.2-bcmath php-imagick

RUN apt-get install -yq lsb-release
RUN apt-get install -yq gnupg
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 8C718D3B5072E1F5
RUN wget -c https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb 
RUN dpkg -i mysql-apt-config_0.8.10-1_all.deb
RUN apt update
RUN apt-get -yq install mysql-server

#COPY /apache2.conf /etc/apache2/apache2.conf
#COPY /php.ini /etc/php/7.2/apache2/php.ini
COPY my.cnf /etc/mysql/my.cnf

RUN wget https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb
RUN dpkg -i mod-pagespeed-*.deb
RUN apt-get -f install
RUN rm mod-pagespeed-*.deb 
RUN a2enmod rewrite 

EXPOSE 80
EXPOSE 3306

COPY /docker-entrypoint.sh /
ENTRYPOINT ["docker-entrypoint.sh"]
