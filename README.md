# hg-remote-update
HG project update over Nginx

# Add to host settings in NGINX:
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
https://project1.loc/up.pl?host=project1&project=https://hg.mymercurial.loc/project1&user=username&pwd=password

Where:

  1. **project1.loc** - your project domain
  2. **project1** - sub directory with your project in `/var/www`
  3. **https://hg.mymercurial.loc/project1** - your project repository URL
  4. **username** - mercurial username
  5. **password** - mercurial password
