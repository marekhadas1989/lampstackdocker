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

<h3>Apache/2.4.29<h3>
<ul>
   <li>OpenSSL</li>
</ul>
   
<h3>PHP 7.2.15 (Laravel ready)<h3>
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

Known Limitations

* By 03/2019 Google Page Speed is not available for ARM microarchitecture
* Latest available version of MySQL for ARM during the built was 5.7

<h1>Quick Start</h1>

<span>Quick start can be done by either issuing following commands or by using <b>docker-compose</b> file provided for each platform</span>
<br>
<h5>x86</h5>
<b>$ docker run marekhadas9/lampstack</b><br/>
<b>$ docker-compose -f /path_to_file/composeX86.yaml up</b><br/>
<h5>ARM</h5>
<b>$ docker run marekhadas9/lampstack:arm</b><br/>
<b>$ docker-compose -f /path_to_file/composeARM.yaml up</b><br/>

