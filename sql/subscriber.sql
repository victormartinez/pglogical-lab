SELECT pglogical.create_node(
    node_name := 'secondary',
    dsn := 'host=postgres_secondary port=5432 dbname=db_secondary user=user_secondary password=password_secondary'
);

SELECT pglogical.create_subscription(
    subscription_name := 'subscription_for_primary_db',
    provider_dsn := 'host=postgres_primary port=5432 dbname=db_primary user=user_primary password=password_primary',
    replication_sets := ARRAY['replication_crm']
);
