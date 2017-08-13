#docker exec -it www.matesocial.com.mysqlserver.container /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P db165289_msocial_user -Q "RESTORE DATABASE db165289_mates FROM DISK = '/var/opt/mssql/backup/db165289_mates.bak' WITH MOVE 'db165289_mates' TO '/var/opt/mssql/data/db165289_mates.mdf', MOVE 'db165289_mates_Log' TO '/var/opt/mssql/data/db165289_mates_Log.ldf' "

#docker exec -it www.matesocial.com.mysqlserver.container /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P db165289_msocial_user -Q "CREATE LOGIN db165289_msocial_user WITH PASSWORD = 'db165289_msocial_user' ,DEFAULT_DATABASE = db165289_mates USE db165289_mates; CREATE USER db165289_msocial_user FOR LOGIN db165289_msocial_user; EXEC sp_addrolemember 'db_owner', 'db165289_msocial_user'"

docker exec -i www.matesocial.com.mysqlserver.container mysql -uroot -pdb165289_msocial_user --force < ./Data/db165298_mates.sql
