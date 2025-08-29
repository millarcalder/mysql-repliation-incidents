<h1 align="center">MySQL Replication Incidents<br></h1>

<h4 align="center">This repository is for my own educational purposes, it is intended to simulate different incidents with a simple MySQL replica setup.</h4>

> A simple MySQL cluster as shown in the diagram below is run using docker compose and there is documentation on how to simulate some incidents and how to resolve them.

<p align="center">
    <img src="docs/diagrams/mysql_cluster.svg" alt="MySQL Cluster Diagram" width="250">
</p>

## Getting Started

### Dependencies

Required
 - [Docker Engine](https://docs.docker.com/engine/)
 - [Docker Compose](https://docs.docker.com/compose/)

Reccommended
 - [Docker Desktop](https://docs.docker.com/desktop/)
 - [DBeaver](https://dbeaver.io/) or similar database tool

### MySQL Details
|                    |           |
|--------------------| ----------|
| Version            | 8.0       |
| Replication Format | row-based |
| Replication Mode   | GTID      |

[Official MySQL replication documentation](https://dev.mysql.com/doc/refman/8.0/en/replication.html)

### Running

```bash
# Start all docker compose services
docker compose up

# Open a shell in the dev container and execute the init script from within the dev container
docker exec -it dev /bin/bash
bash /scripts/init.bash
```

## Incidents

 - [Source Database Fails](docs/incidents/source_db_fails.md)
 - [TODO: Replica Database Fails](docs/incidents/replica_db_fails.md)
 - [TODO: Out of Sync Data](docs/incidents/out_of_sync_data.md)
 - [Restore Subset of Tables from Backup](docs/incidents/restore_backup_subset_of_tables.md)
