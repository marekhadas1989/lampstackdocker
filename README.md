![GitHub Logo](https://raw.githubusercontent.com/marekhadas1989/lampstackdocker/master/guide/logo.png)
# LAMP STACK docker build based on Ubuntu 18.04.2 Image

[ ARM / x86 ] LAMP STACK docker-based environment. 
This setup has been designed to work on either ARM as well as on standard x86-32/64 based platform. 
Depends on selected platform package availability may vary due to internal operating system limitations, please refer to the description below.

<h3>Utils available regardless of the selected platform out of the box<h3>
<ul>
   <li>htop</li>
   <li>ncdu</li>
   <li>curl</li>
   <li>nano</li>
   <li>wget</li>
   <li>supervisor</li>
</ul>
   
<h1>x86 Variant consists of following packages</h1>

1. Certbot for HTTP encryption (* SSL version only)
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

<h1>ARM Variant (4.20.7-sunxi armv7l) 32-bit</h1>
Both images have got same specs apart from minor differences limited by the package availability.
<br/><br/>
Known Limitations:
<br/>

* By 01/03/2019 Google Page Speed was not available for ARM microarchitecture.

* Some of the packages are in older version compares to x86 platform.<br> 
This is purely caused by the popularity of ARM platform.
To even out any differences in terms of software versioning you can use provided <b>docker-compose</b> file.

<h1>Quick Start</h1>

Easiest way to start is to use <b>docker-compose</b> files available for each platform.
You can start by issuing commands manually as listed below as well.
Either way you will get the same result.

<h5>x86 (non SSL)</h5>

```
$ docker run -p 3306:3306 -p 80:80 -d marekhadas9/lampstack:latest
$ docker run -p 3306:3306 -p 80:80 -d -v /docker_lamp/persist_mysql:/var/lib/mysql -v /docker_lamp/persist_www:/var/www/html marekhadas9/lampstack:latest
$ docker-compose -f /path_to_file/composeX86.yaml up
```

<h5>ARM (non SSL)</h5>

```
$ docker run -p 3306:3306 -p 80:80 -d marekhadas9/lampstack:arm
$ docker run -p 3306:3306 -p 80:80 -d -v /docker_lamp/persist_mysql:/var/lib/mysql -v /docker_lamp/persist_www:/var/www/html marekhadas9/lampstack:arm
$ docker-compose -f /path_to_file/composeARM.yaml up
```

<h1>Data persistency</h1>

By default when using docker you should consider all the data produced by your website or database as ephemeral, to stop this from happening you have to map folders you are going to use into volumes.

Speaking of Apache server to persist the data you should map default location of your server into any location on your host machine, to do so all you have to do is just to pass additional parameter as listed below. First part of following command is related to the location on your host machine whereas second one is related to the default location of the web server inside container.

<b>"-v /docker_lamp/persist_www:/var/www/html"</b> parameter,

In the same way you can proceed with the MySQL

<b>"-v /docker_lamp/persist_mysql:/var/lib/mysql"</b> <br><br>
Please note that this is not a MUST it's entirely up to you whether you want to persist the data and where exacly, this is just a basic example so to help you to better understand the general concept behind.

Should you have any problems with typing commands by hand, feel free to use <b>docker-compose</b> files instead. This will help you to save tremendous amount of time, not to mention about handling persistency in a proper way.

<h1>Bringing up SSL to life</h1>

SSL certification process can handled by using <a href="https://certbot.eff.org/">certboot</a>.
This is basically a tool embeded within the images you can use to obtain free certificate valid for 3 months. 
You can obviously freely recure it before it's about to expire.

Thanks to <a href="https://letsencrypt.org/">letsencrypt</a> script you can have your own free globally trusted SSL certificate.

1. Run your container in the way it was mentioned earlier on, by hand or by using compose file, up to you.

    ```$ sudo su```

    ```$ docker-compose -f composeX86Ssl.yaml up```
    
    ![GitHub Logo](https://raw.githubusercontent.com/marekhadas1989/lampstackdocker/master/guide/howto1.PNG)

2. You have to identify your current unique <b>container id</b>.<br/>
   To do so open another terminal window and run while your container is running.
   *You can obviously use existing one if you are runing container in detached mode:
   <br/> 

    ```$ sudo su```
 
    ```$ docker container ls```
     
    ![GitHub Logo](https://raw.githubusercontent.com/marekhadas1989/lampstackdocker/master/guide/howto2.PNG)

3. Every container has got it's unique container id, to identify it you need to use at least first 3 characters or more.
(You can use as many characters as you wish, it is only about to identify unique container)
<br>
4. Now using mentioned <b>container id</b> run:

    ```$ docker exec -it replace_with_container_id bash```
 
    Then run:
 
    ```$ certbot --apache certonly```
    
    then follow the guidelines displayed on your screen.
    
4. Download <b>/conf/default-ssl.conf</b> and update it accordingly with the domain name for which you were issued certificate earlier.
5. Put your file in <b>/etc/default-ssl.conf</b>
6. Restart your container, you should be all set with SSL.
   
    <h1>Defaults</h1>
        * By default MySQL server binds to 0.0.0.0, server will be accessible from anywhere.
        This is causing potential security threat, so it is worth to mention as you have to be concious about that fact.
   
      <b>Default MySQL users are as follows:</b><br>
       
        U:root@'%'
        P:root  
         
        U:phpmyadmin@'localhost'
        P:9wBVSFCcyzAY
        
      Depends on how you are going to use your database you can either connect from 
      localhost by using <b>"phpmyadmin"</b> user.
       
      Or you can also use <b>"root"</b> user for external connections using your server ip address or by using third party
      software like <a href="https://www.mysql.com/products/workbench/">MySQL Workbench</a> or <a href="https://www.heidisql.com/">HeidiSQL</a>
      
      ![GitHub Logo](https://raw.githubusercontent.com/marekhadas1989/lampstackdocker/master/guide/phpmyadmin.PNG)
      
