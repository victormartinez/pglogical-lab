PGPASSWORD=password_primary pgcli -h 127.0.0.1 -p 5432 -U user_primary -d db_primary
PGPASSWORD=password_secondary pgcli -h 127.0.0.1 -p 5433 -U user_secondary -d db_secondary

PGPASSWORD=password_primary psql -h 127.0.0.1 -p 5432 -U user_primary -d db_primary -a -f ddl.sql
PGPASSWORD=password_secondary psql -h 127.0.0.1 -p 5433 -U user_secondary -d db_secondary -a -f ddl.sql


docker compose -f docker-compose.yaml rm