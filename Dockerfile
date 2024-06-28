from postgres:14

RUN curl https://techsupport.enterprisedb.com/api/repository/dl/default/release/deb | bash 

RUN apt-get update && apt-get install -y ca-certificates

RUN apt-get install -y postgresql-common && /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh -y

RUN apt-get install -y postgresql-14-pglogical


# Copie os arquivos de configuração adicionais se necessário
COPY postgresql.conf /etc/postgresql/postgresql.conf

CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]