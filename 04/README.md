
 - **var/www/contact** - znajduja sie pliki projektu.
 - **etc/** - znajduja sie przykladowe konfiguracje serwerow www(Apache lub Nginx).

# 1. Instalacja projektu w Apache2/Debian

```
apt-get install libapache2-mod-wsgi
pip install mod_wsgi
mv var/www/contact /var/www/
cp etc/apache2/sites-available/contact.conf /etc/apache2/sites-available/contact.conf 
a2ensite contact.conf
a2enconf wsgi
service apache2 restart
```

# 2. Instalacja projektu Nginx/Debian
```
pip install gunicorn
mv var/www/contact /var/www/
cp etc/nginx/conf.d/contact.conf /etc/nginx/conf.d/contact.conf
service nginx restart
cd /var/www/contact/api && gunicorn app:application

```
