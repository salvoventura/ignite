#!/bin/bash
################################################################################
#  Author: Salvatore Ventura
# Purpose: Prepare Ubuntu 15 server machine for Ignite App
#    Date: 14 Oct 2015
################################################################################
if [ "`whoami`" != "root"  ]; then
   echo "You must run this script as root"
   echo "Example: sudo install.sh"
   exit 1
fi

#
# Constants
#
IGNITE_ZIP_FILE_URL=https://github.com/salvoventura/ignite/archive/master.zip
ETH0=`ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`

# Initial package installation
apt-get update
apt-get -y install unzip
apt-get -y install python-pip
apt-get -y install sqlite3
apt-get -y install apache2
apt-get -y install libapache2-mod-wsgi
pip install python-dateutil


# Directory structure and ignite code install
mkdir -p /opt/cisco
cd /opt/cisco
wget ${IGNITE_ZIP_FILE_URL}
unzip master.zip
mv ignite-master/ ignite/
cd /opt/cisco/ignite
pip install -r requirement.txt
python manage.py makemigrations
python manage.py migrate

# Create the APACHE config file for ignite
#----------Begin here document-----------#
cat << igniteApacheCoNfFile > /etc/apache2/sites-available/ignite.conf
<VirtualHost *:80>
    #ServerName www.example.com
    #ServerAlias example.com
    #ServerAdmin webmaster@example.com

    DocumentRoot /var/www/html
    <Directory /var/www/html>
    Order allow,deny
    Allow from all
    </Directory>

    Alias /favicon.ico /opt/cisco/ignite/dist/favicon.ico
    Alias /robots.txt /opt/cisco/ignite/dist/robots.txt

    RedirectMatch "^/$" "/ui/"
    Alias /ui/ /opt/cisco/ignite/dist/
    <Directory /opt/cisco/ignite/dist>
    Require all granted
    </Directory>

    WSGIPassAuthorization On
    WSGIScriptAlias / /opt/cisco/ignite/ignite/apache/wsgi.py
    <Directory /opt/cisco/ignite/ignite/apache>
      <Files wsgi.py>
      Require all granted
      </Files>
    </Directory>
    LogLevel info
</VirtualHost>
igniteApacheCoNfFile
#----------End here document-----------#

chown -R www-data:www-data /opt/cisco/ignite
bash /opt/cisco/ignite/configure.sh
a2dissite 000-default
a2ensite ignite
service apache2 restart
echo "Installation complete"
echo "Point your browser at http://${ETH0}/"
