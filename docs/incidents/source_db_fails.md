# Source Database Fails

> Command to simulate this incident: `docker stop db1`

Uh oh your source database is down! Don't worry, it's easy to replace it with one of your replicas.

1. Stop all replication
2. Reset the binary log for the new source
3. Change replication source for all remaining replicas

![incident](../diagrams/incident_1.svg)

```sql
-- Connect to DB3
STOP REPLICA IO_THREAD;
SHOW PROCESSLIST;  -- Check for: Replica has read all relay log;

-- Conenct to DB2 (the new source)
STOP REPLICA;
RESET MASTER;

-- Connect to DB3
CHANGE REPLICATION SOURCE TO
    SOURCE_HOST='db2',
    SOURCE_USER='replica',
    SOURCE_PASSWORD='secret';
START REPLICA;
```

## Source Database Recovers

> Command to simulate this: `docker start db1`

It's easy to configure your old source database as a replica. But maybe your old source database has higher specs and you want to make it the source again, in this case follow the guide below.

1. Setup DB1 (old source) as a replica to get any data changes that might of occured
2. Stop all replication
3. Reset the binary log for DB1
4. Change replication source for all replicas

```sql
-- Connect to DB2
SHOW MASTER STATUS; -- Fetch the binlog file, it might of changed

-- Connect to DB1
CHANGE REPLICATION SOURCE TO
    SOURCE_HOST='db2',
    SOURCE_USER='replica',
    SOURCE_PASSWORD='secret',
    SOURCE_LOG_FILE='<<BINLOG_FILE>>',
    SOURCE_LOG_POS=0;
START REPLICA;

-- Connect to DB3
STOP REPLICA IO_THREAD;
SHOW PROCESSLIST;  -- Check for: Replica has read all relay log;

-- Connect to DB1
STOP REPLICA;
RESET MASTER;

-- Connect to DB2
CHANGE REPLICATION SOURCE TO
    SOURCE_HOST='db1',
    SOURCE_USER='replica',
    SOURCE_PASSWORD='secret';
START REPLICA;

-- Connect to DB3
CHANGE REPLICATION SOURCE TO
    SOURCE_HOST='db1',
    SOURCE_USER='replica',
    SOURCE_PASSWORD='secret';
START REPLICA;
```
