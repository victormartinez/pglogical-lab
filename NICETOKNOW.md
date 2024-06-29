## Nice to Know


1. Be careful when dropping because there are pieces of data in the replica; when subscription is recreated, the replication will fail due to existing primary keys (duplicate key value violates unique constraint).

2. Before dropping the subscription disable it because there are workers in the background.

3. Conflict resolution does not apply during the initial data sync. In case of a clash, the replication will abort. [see reference](https://github.com/2ndQuadrant/pglogical/issues/328).
