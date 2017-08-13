FROM mysql:5.5  
#microsoft/mssql-server-linux:latest

ENV MYSQL_ROOT_PASSWORD=db165289_msocial_user
#ENV ACCEPT_EULA=Y

#COPY db165289_mates.bak /var/opt/mssql/backup/db165289_mates.bak
COPY db165298_mates.sql /var/opt/mysql/backup/db165298_mates.sql
#COPY init_db.sh /tmp/init_db.sh
#RUN /tmp/init_db.sh

EXPOSE 3306