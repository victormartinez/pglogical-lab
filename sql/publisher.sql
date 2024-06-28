SELECT pglogical.create_node(
    node_name := 'primary',
    dsn := 'host=postgres_primary port=5432 dbname=db_primary user=user_primary password=password_primary'
);

SELECT pglogical.create_replication_set('replication_crm');
SELECT pglogical.replication_set_add_all_tables('replication_crm', ARRAY['crm']);
