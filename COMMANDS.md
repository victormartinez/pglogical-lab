## Useful Commands

#### 

```sql
select pglogical.node
```

```sql
show pglogical.conflict_resolution
```

```
select * FROM pg_replication_slots;
```


```sql
SHOW track_commit_timestamp;
```

```sql
set pglogical.conflict_resolution = 'keep_local';
```


#### Primary


```sql
select pglogical.replication_set
```


```sql
select pglogical.replication_set_table;
```


#### Replica 
List the sync status of the tables.

```sql
select * from pglogical.local_sync_status;
```

List subscription statuses:

```sql
select pglogical.show_subscription_status();
```

Force subscription synchronization without truncating data:

```sql
select pglogical.alter_subscription_synchronize('subscription_for_primary_db', false);
```

Force subscription synchronization truncating data:

```sql
select pglogical.alter_subscription_synchronize('subscription_for_primary_db', true);
```

Force subscription synchronization by enabling and disabling:

```sql
select pglogical.alter_subscription_disable('subscription_for_primary_db', true);
select pglogical.alter_subscription_enable('subscription_for_primary_db', true);
```

Delete subscription if exists:

```sql
select pglogical.drop_subscription('subscription_for_primary_db', true)
```
