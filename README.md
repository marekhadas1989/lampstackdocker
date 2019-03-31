# LAMP STACK docker build based on Ubuntu 18.04.2 Image

[ ARM / x86 ] LAMP STACK docker-based environment designed to work on either ARM architecture based systems as well as standard x86 platform. Depends on selected platform package availability may vary due to internal operation system limitations, please refer to the description below.

<h3>Utils available out of the box regardles of selected platform<h3>
<ul>
   <li>htop</li>
   <li>ncdu</li>
   <li>curl</li>
   <li>nano</li>
   <li>wget</li>
   <li>supervisor</li>
</ul>
   
<h1>x86 Variant consists of following packages</h1>

1. Certbot for HTTP encryption
2. phpMyAdmin 4.6.6
3. MySQL 8.0.15
4. Apache/2.4.29
<ul>
   <li>OpenSSL</li>
   <li>core_module (static)</li>
   <li>so_module (static)</li>
   <li>watchdog_module (static)</li>
   <li>http_module (static)</li>
   <li>log_config_module (static)</li>
   <li>logio_module (static)</li>
   <li>version_module (static)</li>
   <li>unixd_module (static)</li>
   <li>access_compat_module (shared)</li>
   <li>alias_module (shared)</li>
   <li>auth_basic_module (shared)</li>
   <li>authn_core_module (shared)</li>
   <li>authn_file_module (shared)</li>
   <li>authz_core_module (shared)</li>
   <li>authz_host_module (shared)</li>
   <li>authz_user_module (shared)</li>
   <li>autoindex_module (shared)</li>
   <li>deflate_module (shared)</li>
   <li>dir_module (shared)</li>
   <li>env_module (shared)</li>
   <li>filter_module (shared)</li>
   <li>mime_module (shared)</li>
   <li>mpm_prefork_module (shared)</li>
   <li>negotiation_module (shared)</li>
   <li><b>pagespeed_module (shared)</b></li>
   <li>php7_module (shared)</li>
   <li>reqtimeout_module (shared)</li>
   <li>rewrite_module (shared)</li>
   <li>setenvif_module (shared)</li>
   <li>status_module (shared)</li>
</ul>
   
5. PHP 7.2.15 (Laravel ready)
<ul>
   <li>Curl 7.58.0</li>
   <li>Ctype</li>
   <li>GD 2.2.5</li>
   <li>Imagick 3.4.3RC2</li>
   <li>Pear 2.0.2</li>
   <li>Zip 1.15.4</li>
   <li>Mbstring 1.3.2</li>
   <li>XML 2.9.4</li>
   <li>JSON 1.6.0</li>
   <li>mysql 5.0.12</li>
   <li>OpenSSL 1.1.0g 2 Nov 2017</li>
   <li>PDO 5.0.12</li>
   <li>Tokenizer</li>
   <li>BCMath</li>
</ul>

<h1>ARM Variant</h1>
Apart from minor differences as listed below it has pretty much the same specs.<br/><br/>
Known Limitations:<br/><br/>

* By 01/03/2019 Google Page Speed was not available for ARM microarchitecture.
* Latest available version of MySQL for ARM based devices during that built was 5.7.

<h1>Quick Start</h1>
Quick start can be done by either issuing following commands or by using <b>docker-compose</b> files provided for each platform.</br></br>

* Data persistency can be done by passing additional <b>"-v /docker_lamp/persist_www:/var/www/html"</b> parameter, this will map internal <b>"/var/www/html"</b> folder into <b>"/docker_lamp/persist_www"</b> on your local machine.<br> In the same way MySQL data can be mapped by passing again <b>"-v /docker_lamp/persist_mysql:/var/lib/mysql"</b> <br><br>
It is entirely up to you where you want to store the data, this is just an example of how to use it.


* By using provided <b>docker-compose</b> files data persistency will be turned on automatically for both MySQL and Apache.

<h5>x86</h5>

```
$ docker run -p 3306:3306 -p 80:80 -d marekhadas9/lampstack:latest
$ docker run -p 3306:3306 -p 80:80 -d -v /docker_lamp/persist_mysql:/var/lib/mysql -v /docker_lamp/persist_www:/var/www/html marekhadas9/lampstack:latest
$ docker-compose -f /path_to_file/composeX86.yaml up
```

<h5>ARM</h5>

```
$ docker run -p 3306:3306 -p 80:80 -d marekhadas9/lampstack:arm
$ docker run -p 3306:3306 -p 80:80 -d -v /docker_lamp/persist_mysql:/var/lib/mysql -v /docker_lamp/persist_www:/var/www/html marekhadas9/lampstack:arm
$ docker-compose -f /path_to_file/composeARM.yaml up
```
<h1>Bringing up SSL to life</h1>
SSL certification process can be sorted out by using <a href="https://certbot.eff.org/">certboot</a> tool included in SSL version of provided images</a>.<br> Thanks to <a href="https://letsencrypt.org/">letsencrypt</a> you can have your own free globally trusted SSL certificate.<br/><br/>

1. Download <b>composeX86ssl.yaml</b> from my git repository and put it on your server, then run from command line.<br/> <br/>
```$ sudo su```<br/>
```$ docker-compose -f composeX86ssl.yaml up```
<br/><br/>

2. Now it's time to identify unique <b>container id</b>. To do so while your container is running open another terminal window and run:<br/> <br/> 
 ```$ sudo su```<br><br>
 ```$ docker container ls```<br>
<br/>
3. You need to know at least first 3 characters of <b>container id</b> returned by above command (You can use as many characters as you wish, it is just about identifying unique container especially if there is more than one having similar hash running on your machine).<br>
4. Now using mentioned <b>container id</b> run:<br><br>
 ```$ docker exec -it 7ce bash```<br><br>
 Then run:<br><br>
 ```certbot --apache certonly```<br><br>
 To issue your certificate and follow the guidelines displayed on your screen<br>
4. Download <b>/conf/default-ssl.conf</b> from my git repository and update it accordingly to the domain name for which you were issuing certificate earlier.
5. Put your file in <b>/etc/default-ssl.conf</b>
6. Restart your container, you should be all set with SSL.
   