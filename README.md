# hg-remote-update
HG project update over Nginx

# Install script
```
apt-get install nginx libfcgi-perl
wget http://nginxlibrary.com/downloads/perl-fcgi/fastcgi-wrapper -O /usr/bin/fastcgi-wrapper.pl
wget http://nginxlibrary.com/downloads/perl-fcgi/perl-fcgi -O /etc/init.d/perl-fcgi
chmod +x /usr/bin/fastcgi-wrapper.pl
chmod +x /etc/init.d/perl-fcgi
update-rc.d perl-fcgi defaults
apt-get install libcgi-session-perl
change username *www-data* to *root* in daemon script(/etc/init.d/perl-fcgi)
/etc/init.d/perl-fcgi start
mkdir /var/www
mkdir /var/www/nginx
wget https://github.com/sciner/hg-remote-update/raw/master/up.pl -O /var/www/nginx/up.pl
wget https://github.com/sciner/hg-remote-update/raw/master/up.sh -O /var/www/nginx/up.sh
chmod +x /var/www/nginx/up.pl
chmod +x /var/www/nginx/up.sh
```

# Add to host settings in Nginx:
```
    root /var/www/nginx;
    location ~ \\.pl|cgi$ {
        try_files $uri =404;
        gzip off;
        fastcgi_pass  127.0.0.1:8999;
        fastcgi_index up.pl;
        fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
```

# Link for update your project over Nginx:
https://project1.loc/up.pl?host=project1&project=hg.mymercurial.loc/project1&user=username&pwd=password

Where:

  1. **project1.loc** - your project domain
  2. **project1** - sub directory with your project in `/var/www`
  3. **hg.mymercurial.loc/project1** - your project repository URL
  4. **username** - mercurial username
  5. **password** - mercurial password
