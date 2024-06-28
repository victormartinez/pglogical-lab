.PHONY: up-containers
up-containers:
	docker compose up


.PHONY: db-upgrade
db-upgrade:
	PGPASSWORD=password_primary psql -h 127.0.0.1 -p 5432 -U user_primary -d db_primary -a -f sql/extensions.sql
	PGPASSWORD=password_primary psql -h 127.0.0.1 -p 5432 -U user_primary -d db_primary -a -f sql/ddl.sql
	PGPASSWORD=password_secondary psql -h 127.0.0.1 -p 5433 -U user_secondary -d db_secondary -a -f sql/extensions.sql
	PGPASSWORD=password_secondary psql -h 127.0.0.1 -p 5433 -U user_secondary -d db_secondary -a -f sql/ddl.sql


.PHONY: init-replication
init-replication:
	PGPASSWORD=password_primary psql -h 127.0.0.1 -p 5432 -U user_primary -d db_primary -a -f sql/publisher.sql
	PGPASSWORD=password_secondary psql -h 127.0.0.1 -p 5433 -U user_secondary -d db_secondary -a -f sql/subscriber.sql


.PHONY: connect-primary
connect-primary:
	PGPASSWORD=password_primary pgcli -h 127.0.0.1 -p 5432 -U user_primary -d db_primary

.PHONY: connect-secondary
connect-secondary:
	PGPASSWORD=password_secondary pgcli -h 127.0.0.1 -p 5433 -U user_secondary -d db_secondary

.PHONY: insert-data
insert-data:
	PGPASSWORD=password_primary psql -h 127.0.0.1 -p 5432 -U user_primary -d db_primary -a -f sql/dml.sql

.PHONY: rm-containers
rm-containers:
	docker compose -f docker-compose.yaml rm

.PHONY: rm-images
rm-images:
	docker image rm pglogical-lab-postgres_primary
	docker image rm pglogical-lab-postgres_secondary
