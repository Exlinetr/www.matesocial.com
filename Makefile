initialize:
    sudo make up
    sudo make db-initialize
    sudo make nginx-config
db-initialize:
    sudo chmod a+x ./migration.sh
    ./migration.sh
nginx-config:
    cp matesocial.com /etc/nginx/sites-available/
    cp /etc/nginx/sites-available/matesocial.com /etc/nginx/sites-enabled/matesocial.com
    service nginx restart
up:
    sudo docker-compose up -d
down:
    sudo docker-compose down
