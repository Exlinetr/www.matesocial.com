upstream matesociallive{
    server 127.0.0.1:1002;
}

server {

    listen 80;
    listen [::]:80;
    server_name matesocial.com www.matesocial.com;
    location / {
        proxy_pass http://matesociallive;
    }
    location /contents/ {
        expires 30d;
        proxy_pass http://matesociallive;
    }
}
